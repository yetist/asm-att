if host_machine.cpu_family() == 'loongarch64'
  subdir('la64')
elif host_machine.cpu_family() == 'x86_64'
  subdir('x64')
else
  subdir(host_machine.cpu_family())
endif
