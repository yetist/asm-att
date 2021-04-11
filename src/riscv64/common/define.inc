# vim: set ft=asm:
# vim: set ts=4 sts=4 sw=4 expandtab:
.equ SYS_io_setup, 0
.equ SYS_io_destroy, 1
.equ SYS_io_submit, 2
.equ SYS_io_cancel, 3
.equ SYS_io_getevents, 4
.equ SYS_setxattr, 5
.equ SYS_lsetxattr, 6
.equ SYS_fsetxattr, 7
.equ SYS_getxattr, 8
.equ SYS_lgetxattr, 9
.equ SYS_fgetxattr, 10
.equ SYS_listxattr, 11
.equ SYS_llistxattr, 12
.equ SYS_flistxattr, 13
.equ SYS_removexattr, 14
.equ SYS_lremovexattr, 15
.equ SYS_fremovexattr, 16
.equ SYS_getcwd, 17
.equ SYS_lookup_dcookie, 18
.equ SYS_eventfd2, 19
.equ SYS_epoll_create1, 20
.equ SYS_epoll_ctl, 21
.equ SYS_epoll_pwait, 22
.equ SYS_dup, 23
.equ SYS_dup3, 24
.equ SYS_inotify_init1, 26
.equ SYS_inotify_add_watch, 27
.equ SYS_inotify_rm_watch, 28
.equ SYS_ioctl, 29
.equ SYS_ioprio_set, 30
.equ SYS_ioprio_get, 31
.equ SYS_flock, 32
.equ SYS_mknodat, 33
.equ SYS_mkdirat, 34
.equ SYS_unlinkat, 35
.equ SYS_symlinkat, 36
.equ SYS_linkat, 37
.equ SYS_renameat, 38
.equ SYS_umount2, 39
.equ SYS_mount, 40
.equ SYS_pivot_root, 41
.equ SYS_nfsservctl, 42
.equ SYS_fallocate, 47
.equ SYS_faccessat, 48
.equ SYS_chdir, 49
.equ SYS_fchdir, 50
.equ SYS_chroot, 51
.equ SYS_fchmod, 52
.equ SYS_fchmodat, 53
.equ SYS_fchownat, 54
.equ SYS_fchown, 55
.equ SYS_openat, 56
.equ SYS_close, 57
.equ SYS_vhangup, 58
.equ SYS_pipe2, 59
.equ SYS_quotactl, 60
.equ SYS_getdents64, 61
.equ SYS_read, 63
.equ SYS_write, 64
.equ SYS_readv, 65
.equ SYS_writev, 66
.equ SYS_pread64, 67
.equ SYS_pwrite64, 68
.equ SYS_preadv, 69
.equ SYS_pwritev, 70
.equ SYS_pselect6, 72
.equ SYS_ppoll, 73
.equ SYS_signalfd4, 74
.equ SYS_vmsplice, 75
.equ SYS_splice, 76
.equ SYS_tee, 77
.equ SYS_readlinkat, 78
.equ SYS_sync, 81
.equ SYS_fsync, 82
.equ SYS_fdatasync, 83
.equ SYS_sync_file_range2, 84
.equ SYS_sync_file_range, 84
.equ SYS_timerfd_create, 85
.equ SYS_timerfd_settime, 86
.equ SYS_timerfd_gettime, 87
.equ SYS_utimensat, 88
.equ SYS_acct, 89
.equ SYS_capget, 90
.equ SYS_capset, 91
.equ SYS_personality, 92
.equ SYS_exit, 93
.equ SYS_exit_group, 94
.equ SYS_waitid, 95
.equ SYS_set_tid_address, 96
.equ SYS_unshare, 97
.equ SYS_futex, 98
.equ SYS_set_robust_list, 99
.equ SYS_get_robust_list, 100
.equ SYS_nanosleep, 101
.equ SYS_getitimer, 102
.equ SYS_setitimer, 103
.equ SYS_kexec_load, 104
.equ SYS_init_module, 105
.equ SYS_delete_module, 106
.equ SYS_timer_create, 107
.equ SYS_timer_gettime, 108
.equ SYS_timer_getoverrun, 109
.equ SYS_timer_settime, 110
.equ SYS_timer_delete, 111
.equ SYS_clock_settime, 112
.equ SYS_clock_gettime, 113
.equ SYS_clock_getres, 114
.equ SYS_clock_nanosleep, 115
.equ SYS_syslog, 116
.equ SYS_ptrace, 117
.equ SYS_sched_setparam, 118
.equ SYS_sched_setscheduler, 119
.equ SYS_sched_getscheduler, 120
.equ SYS_sched_getparam, 121
.equ SYS_sched_setaffinity, 122
.equ SYS_sched_getaffinity, 123
.equ SYS_sched_yield, 124
.equ SYS_sched_get_priority_max, 125
.equ SYS_sched_get_priority_min, 126
.equ SYS_sched_rr_get_interval, 127
.equ SYS_restart_syscall, 128
.equ SYS_kill, 129
.equ SYS_tkill, 130
.equ SYS_tgkill, 131
.equ SYS_sigaltstack, 132
.equ SYS_rt_sigsuspend, 133
.equ SYS_rt_sigaction, 134
.equ SYS_rt_sigprocmask, 135
.equ SYS_rt_sigpending, 136
.equ SYS_rt_sigtimedwait, 137
.equ SYS_rt_sigqueueinfo, 138
.equ SYS_rt_sigreturn, 139
.equ SYS_setpriority, 140
.equ SYS_getpriority, 141
.equ SYS_reboot, 142
.equ SYS_setregid, 143
.equ SYS_setgid, 144
.equ SYS_setreuid, 145
.equ SYS_setuid, 146
.equ SYS_setresuid, 147
.equ SYS_getresuid, 148
.equ SYS_setresgid, 149
.equ SYS_getresgid, 150
.equ SYS_setfsuid, 151
.equ SYS_setfsgid, 152
.equ SYS_times, 153
.equ SYS_setpgid, 154
.equ SYS_getpgid, 155
.equ SYS_getsid, 156
.equ SYS_setsid, 157
.equ SYS_getgroups, 158
.equ SYS_setgroups, 159
.equ SYS_uname, 160
.equ SYS_sethostname, 161
.equ SYS_setdomainname, 162
.equ SYS_getrlimit, 163
.equ SYS_setrlimit, 164
.equ SYS_getrusage, 165
.equ SYS_umask, 166
.equ SYS_prctl, 167
.equ SYS_getcpu, 168
.equ SYS_gettimeofday, 169
.equ SYS_settimeofday, 170
.equ SYS_adjtimex, 171
.equ SYS_getpid, 172
.equ SYS_getppid, 173
.equ SYS_getuid, 174
.equ SYS_geteuid, 175
.equ SYS_getgid, 176
.equ SYS_getegid, 177
.equ SYS_gettid, 178
.equ SYS_sysinfo, 179
.equ SYS_mq_open, 180
.equ SYS_mq_unlink, 181
.equ SYS_mq_timedsend, 182
.equ SYS_mq_timedreceive, 183
.equ SYS_mq_notify, 184
.equ SYS_mq_getsetattr, 185
.equ SYS_msgget, 186
.equ SYS_msgctl, 187
.equ SYS_msgrcv, 188
.equ SYS_msgsnd, 189
.equ SYS_semget, 190
.equ SYS_semctl, 191
.equ SYS_semtimedop, 192
.equ SYS_semop, 193
.equ SYS_shmget, 194
.equ SYS_shmctl, 195
.equ SYS_shmat, 196
.equ SYS_shmdt, 197
.equ SYS_socket, 198
.equ SYS_socketpair, 199
.equ SYS_bind, 200
.equ SYS_listen, 201
.equ SYS_accept, 202
.equ SYS_connect, 203
.equ SYS_getsockname, 204
.equ SYS_getpeername, 205
.equ SYS_sendto, 206
.equ SYS_recvfrom, 207
.equ SYS_setsockopt, 208
.equ SYS_getsockopt, 209
.equ SYS_shutdown, 210
.equ SYS_sendmsg, 211
.equ SYS_recvmsg, 212
.equ SYS_readahead, 213
.equ SYS_brk, 214
.equ SYS_munmap, 215
.equ SYS_mremap, 216
.equ SYS_add_key, 217
.equ SYS_request_key, 218
.equ SYS_keyctl, 219
.equ SYS_clone, 220
.equ SYS_execve, 221
.equ SYS_swapon, 224
.equ SYS_swapoff, 225
.equ SYS_mprotect, 226
.equ SYS_msync, 227
.equ SYS_mlock, 228
.equ SYS_munlock, 229
.equ SYS_mlockall, 230
.equ SYS_munlockall, 231
.equ SYS_mincore, 232
.equ SYS_madvise, 233
.equ SYS_remap_file_pages, 234
.equ SYS_mbind, 235
.equ SYS_get_mempolicy, 236
.equ SYS_set_mempolicy, 237
.equ SYS_migrate_pages, 238
.equ SYS_move_pages, 239
.equ SYS_rt_tgsigqueueinfo, 240
.equ SYS_perf_event_open, 241
.equ SYS_accept4, 242
.equ SYS_recvmmsg, 243
.equ SYS_arch_specific_syscall, 244
.equ SYS_wait4, 260
.equ SYS_prlimit64, 261
.equ SYS_fanotify_init, 262
.equ SYS_fanotify_mark, 263
.equ SYS_name_to_handle_at, 264
.equ SYS_open_by_handle_at, 265
.equ SYS_clock_adjtime, 266
.equ SYS_syncfs, 267
.equ SYS_setns, 268
.equ SYS_sendmmsg, 269
.equ SYS_process_vm_readv, 270
.equ SYS_process_vm_writev, 271
.equ SYS_kcmp, 272
.equ SYS_finit_module, 273
.equ SYS_sched_setattr, 274
.equ SYS_sched_getattr, 275
.equ SYS_renameat2, 276
.equ SYS_seccomp, 277
.equ SYS_getrandom, 278
.equ SYS_memfd_create, 279
.equ SYS_bpf, 280
.equ SYS_execveat, 281
.equ SYS_userfaultfd, 282
.equ SYS_membarrier, 283
.equ SYS_mlock2, 284
.equ SYS_copy_file_range, 285
.equ SYS_preadv2, 286
.equ SYS_pwritev2, 287
.equ SYS_pkey_mprotect, 288
.equ SYS_pkey_alloc, 289
.equ SYS_pkey_free, 290
.equ SYS_statx, 291
.equ SYS_io_pgetevents, 292
.equ SYS_rseq, 293
.equ SYS_kexec_file_load, 294
.equ SYS_syscalls, 295
.equ STDIN, 0
.equ STDOUT, 1
.equ STDERR, 2
.equ EXIT_SUCCESS, 0
.equ EXIT_FAILURE, 1