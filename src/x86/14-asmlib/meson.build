executable('inttest',
  'inttest.c',
  'square.s',
  c_args: c_args,
  link_args: ['-m32', '-no-pie'],
  build_rpath: rpath,
)

executable('mainprog',
  'mainprog.c',
  'asmfunc.s',
  c_args: c_args,
  link_args: ['-m32', '-no-pie'],
  build_rpath: rpath,
)

executable('multtest',
  'multtest.c',
  'greater.s',
  c_args: c_args,
  link_args: ['-m32', '-no-pie'],
  build_rpath: rpath,
)

executable('floattest',
  'floattest.c',
  'areafunc.s',
  c_args: c_args,
  link_args: ['-m32', '-no-pie'],
  build_rpath: rpath,
)

executable('badprog',
  'badprog.c',
  'testfunc.s',
  c_args: c_args,
  link_args: ['-m32', '-no-pie'],
  build_rpath: rpath,
)

executable('goodprog',
  'goodprog.c',
  'testfunc.s',
  c_args: c_args,
  link_args: ['-m32', '-no-pie'],
  build_rpath: rpath,
)

executable('mathtest',
  'mathtest.c',
  'fpmathfunc.s',
  c_args: c_args,
  link_args: ['-m32', '-no-pie'],
  build_rpath: rpath,
)


executable('stringtest',
  'stringtest.c',
  'cpuidfunc.s',
  c_args: c_args,
  link_args: ['-m32', '-no-pie'],
  build_rpath: rpath,
)

#executable('externtest',
#  'externtest.cpp',
#  'areafunc.s',
#  'cpuidfunc.s',
#  'square.s',
#  c_args: c_args,
#  link_args: ['-m32', '-no-pie'],
#  build_rpath: rpath,
#)
