asm_sources = [
]

dynamic_sources = [
  'fpmath1-i686.S',
]

static_sources = [
  'fcmovtest-i686.S',
  'fcomitest-i686.S',
  'fcomtest-i686.S',
  'fpmath2-i686.S',
  'fpuenv-i686.S',
  'fpusave-i686.S',
  'fscaletest-i686.S',
  'getstatus-i686.S',
  'logtest-i686.S',
  'premtest-i686.S',
  'roundtest-i686.S',
  'setprec-i686.S',
  'stacktest-i686.S',
  'trigtest1-i686.S',
  'trigtest2-i686.S',
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
