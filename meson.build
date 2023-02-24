project('asm-att', 'c')

c_args = []
#lib_link_args = []
gas_link_args = ['-static', '-nostdlib', '-nostartfiles', '-e_start']
lib_link_args = ['-no-pie', '-nostdlib', '-lc']

if meson.is_cross_build()
  rpath = '/usr/lib'
  if host_machine.cpu_family() == 'x86'
    rpath = meson.get_cross_property('rpath')
  elif host_machine.cpu_family() == 'x86_64'
    lib_link_args += ['-no-pie', '-nostdlib', '-lc']
  elif host_machine.cpu_family() == 'mips64'
    gas_link_args += '-Wl,-e_start'
    #lib_link_args = ['-Wl,-dynamic-linker=@0@'.format(meson.get_cross_property('ldpath'))]
    rpath = meson.get_cross_property('rpath')
  elif host_machine.cpu_family() in ['riscv64', 'aarch64', 'loongarch64']
    lib_link_args = ['-Wl,-dynamic-linker=@0@'.format(meson.get_cross_property('ldpath'))]
    rpath = meson.get_cross_property('rpath')
  else
    error('skipping test on this platform')
  endif
else  # native build
  if host_machine.cpu_family() in ['riscv64', 'aarch64', 'loongarch64']
    lib_link_args = ['-Wl,-dynamic-linker=@0@'.format('/lib64/ld-linux-loongarch-lp64d.so.1')]
    rpath = '/lib'
  endif
endif

# nasm
#if host_machine.cpu_family() in ['x86', 'x86_64']
if host_machine.cpu_family() == 'x86' or host_machine.cpu_family() == 'x86_64'
  if host_machine.system() == 'linux'
    if host_machine.cpu_family() == 'x86'
      asm_format = 'elf32'
    elif host_machine.cpu_family() == 'x86_64'
      asm_format = 'elf64'
    endif
  elif host_machine.system() == 'windows'
    if host_machine.cpu_family() == 'x86'
      asm_format = 'win32'
    elif host_machine.cpu_family() == 'x86_64'
      asm_format = 'win64'
    endif
  endif

  nasm = find_program('nasm', required: false)
  if not nasm.found()
    error('nasm not available')
  endif

  asm_gen = generator(nasm,
    output : '@BASENAME@.o',
    arguments : [
      '-f', asm_format,
      '-i', meson.current_source_dir() + '/',
      '-i', join_paths(meson.current_source_dir(), ''),
      '-o', '@OUTPUT@',
      '@INPUT@'])
endif

subdir('conf')
subdir('src')
