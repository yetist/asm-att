asm_sources = [
]

dynamic_sources = [
  'convert-i686.S',
]

static_sources = [
  'cmpstest1-i686.S',
  'cmpstest2-i686.S',
  'movstest1-i686.S',
  'movstest2-i686.S',
  'movstest3-i686.S',
  'reptest1-i686.S',
  'reptest2-i686.S',
  'reptest3-i686.S',
  'reptest4-i686.S',
  'scastest1-i686.S',
  'scastest2-i686.S',
  'stostest1-i686.S',
  'strcomp-i686.S',
  'strsize-i686.S',
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
