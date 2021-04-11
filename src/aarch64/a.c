/* vi: set sw=4 ts=4 sts=4 expandtab wrap ai: */
/*
 * a.c: This file is part of ____
 *
 * Copyright (C) 2021 yetist <yetist@yetipc>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 * */
#include <stdio.h>
#include <stdint.h>

static inline __attribute__ (( always_inline, const )) uint16_t
__bswap_variable_16 ( uint16_t x ) {
    __asm__ ( "rev16 %0, %1" : "=r" ( x ) : "r" ( x ) );
    return x;
}

static inline __attribute__ (( always_inline )) void
__bswap_16s ( uint16_t *x ) {
    *x = __bswap_variable_16 ( *x );
}

static inline __attribute__ (( always_inline, const )) uint32_t
__bswap_variable_32 ( uint32_t x ) {
    __asm__ ( "rev32 %0, %1" : "=r" ( x ) : "r" ( x ) );
    return x;
}

static inline __attribute__ (( always_inline )) void
__bswap_32s ( uint32_t *x ) {
    *x = __bswap_variable_32 ( *x );
}

static inline __attribute__ (( always_inline, const )) uint64_t
__bswap_variable_64 ( uint64_t x ) {
    __asm__ ( "rev %0, %1" : "=r" ( x ) : "r" ( x ) );
    return x;
}

static inline __attribute__ (( always_inline )) void
__bswap_64s ( uint64_t *x ) {
    *x = __bswap_variable_64 ( *x );
}


int main(int argc, char** argv)
{
    uint16_t x, y;
    uint16_t *xp;
    x = 0x1234;

    xp = &x;

    y = __bswap_variable_16 ( x );
    printf("x, y = %x, %x\n", x, y);

    printf("*xp = %x, ", *xp);
    __bswap_16s( xp );
    printf("%x\n", *xp);

    uint32_t x32, y32, *xp32;

    x32 = 0x12345678;
    xp32 = &x32;

    y32 = __bswap_variable_32 ( x32 );
    printf("x32, y32 = %x, %x\n", x32, y32);

    printf("*xp32 = %x, ", *xp32);
    __bswap_32s( xp32 );
    printf("%x\n", *xp32);

    uint64_t x64, y64, *xp64;

    x64 = 0x12345678aabbccdd;
    xp64 = &x64;

    y64 = __bswap_variable_64 ( x64 );
    printf("x64, y64 = %p, %p\n", x64, y64);

    printf("*xp64 = %p, ", *xp64);
    __bswap_64s( xp64 );
    printf("%p\n", *xp64);

    return 0;
}
