# quicksort(*arr, lo, hi)
# arr -> a1
# lo -> a2
# hi -> a3
quicksort:
    #blt: 小于时跳转，if a3 < a2, goto quicksort_exit, 即 if (lo >= hi) 时返回
    blt a3, a2, quicksort_exit

    # 保存一些寄存器值到栈中
    addi sp, sp, -32    # sp = sp - 32
    sd   ra, 0(sp)      # sd: 存双字, sp[7..0] = ra
    sd   s10, 8(sp)     # sd: 存双字, sp[15..8] = s10
    sd   s11, 16(sp)    # sd: 存双字, sp[23..16] = s11
    sd   s9, 24(sp)     # sd: 存双字, sp[31..24] = s9

    # 保存以下寄存器值
    # sp --24-- s9
    # sp --16-- s11     hi
    # sp -- 8-- s10     lo
    # sp -- 0-- ra

    # 保存lo和hi值
    mv s10, a2          # s10 <- lo
    mv s11, a3          # s11 <- hi

    # 调用 partition
    jal ra, partition   # partition(&array, lo, hi)

    # save the pivot on s9
    mv s9, a0

    # s9 = pivot
    # s10 = lo
    # s11 = hi
    # recursively call quicksort on both subarrays
    addi a3, s9, -1         # hi = pivot (-1)
    mv a2, s10              # lo = lo
    jal ra, quicksort       # quicksort(a1, lo, pivot-1)

    addi a2, s9, 1          # lo = pivot (+1)
    mv a3, s11              # hi = hi
    jal ra, quicksort

    # load stuff back from the stack
    ld ra, 0(sp)
    ld s10, 8(sp)
    ld s11, 16(sp)
    ld s9, 24(sp)
    addi sp, sp, 32

quicksort_exit:
    ret

# partition(byte[] *array, lo, hi) -> pivot
# partition(*arr, lo, hi) -> pivot
# arr -> a1
# lo -> a2
# hi -> a3
# pivot <- a0 (return value)
partition:
    # save stuff in the stack
    addi sp, sp, -24
    sd ra, 0(sp)
    sd s10, 8(sp)
    sd s11, 16(sp)

    # 保存以下寄存器值
    # sp --16-- s11     hi
    # sp -- 8-- s10     lo
    # sp -- 0-- ra

    # init pivot to high (a3)
    add t0, a1, a3      # t0 = testarray + hi
    lbu t0, 0(t0)       # t0 = *t0

    addi t2, a2, -1     # (i) index of the smaller element => t2 = low - 1
    mv t6, a2           # t6 = j = low
    addi t5, a3, -1     # t5 = high-1

partition_forloop:
    bgt t6, t5, partition_forloop_end   # if t6 > t5 then partition_forloop_end
    add s11, a1, t6                     # s11 = *arr[j]
    lbu t1, 0(s11)                      # t1 = *(arr[j])

    bgtu t1, t0, partition_forloop_inner_skip    # if t1>t0 skip (if arr[j]>pivot)
    addi t2, t2, 1      # i++
    add s10, a1, t2     # s10 = *arr[t2] = *arr[i]
    lbu t3, 0(s10)       # t3 = *(arr[i])
    sb t3, 0(s11)       # arr[j] = t3
    sb t1, 0(s10)       # arr[i] = t1

partition_forloop_inner_skip:
    addi t6, t6, 1  # j++
    j partition_forloop

partition_forloop_end:
    addi a0, t2, 1      # write return value as i+1

    # swap(&arr[i+1], &arr[high])
    add  s10, a1, a0         # s10 = *arr[i+1]
    add  s11, a1, a3         # s11 = *arr[high]
    lbu  t2, 0(s10)          # t2 = *s10
    lbu  t3, 0(s11)          # t3 = *s11
    sb   t2, 0(s11)
    sb   t3, 0(s10)

    # load stuff back from the stack
    ld   ra, 0(sp)
    ld   s10, 8(sp)
    ld   s11, 16(sp)
    addi sp, sp, 24

partition_bail:
    ret
