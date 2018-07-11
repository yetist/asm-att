/* vi: set sw=4 ts=4 sts=4 expandtab wrap ai: */
/*
 * sss.c: This file is part of ____
 *
 * Copyright (C) 2020 yetist <yetist@yetibook>
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
#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>

int main() {
    unsigned cpu, node;
    syscall(SYS_getcpu, &cpu, &node, NULL);
    printf("This program is running on CPU core %u and NUMA node %u.\n\n", cpu, node);
    return 0;
}
