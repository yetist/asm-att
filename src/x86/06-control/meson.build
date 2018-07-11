asm_sources = [
]

dynamic_sources = [
  'betterloop-i686.S',
  'calltest-i686.S',
  'loop-i686.S',
  'signtest-i686.S',
]

static_sources = [
  'cmptest-i686.S',
  'jumptest-i686.S',
  'paritytest-i686.S',
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
