asm_sources = [
]

dynamic_sources = [
  'adctest-i686.S',
  'addtest4-i686.S',
  'cpuidtest-i686.S',
  'divtest-i686.S',
  'multest-i686.S',
  'sbbtest-i686.S',
  'subtest3-i686.S',
]

static_sources = [
  'aaatest-i686.S',
  'addtest1-i686.S',
  'addtest2-i686.S',
  'addtest3-i686.S',
  'dastest-i686.S',
  'imultest2-i686.S',
  'imultest-i686.S',
  'saltest-i686.S',
  'subtest1-i686.S',
  'subtest2-i686.S',
]

foreach src: static_sources
  base = src.split('.')[0]
  executable(base,
    src,
    c_args: c_args,
    link_args: gas_link_args,
  )
endforeach

foreach src: dynamic_sources
  base = src.split('.')[0]
  executable(base,
    src,
    link_args: lib_link_args,
    c_args: c_args,
    build_rpath: rpath,
  )
endforeach

foreach src: asm_sources
  base = src.split('.')[0]+'-asm'
  executable(base,
    asm_gen.process(src),
    link_args: gas_link_args,
  )
endforeach
