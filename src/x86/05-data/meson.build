asm_sources = [
]

dynamic_sources = [
  'cmovtest-i686.S',
  'movtest3-i686.S',
]

static_sources = [
  'bubble-i686.S',
  'cmpxchgtest-i686.S',
  'movtest1-i686.S',
  'movtest2-i686.S',
  'movtest4-i686.S',
  'pushpop-i686.S',
  'sizetest1-i686.S',
  'sizetest2-i686.S',
  'sizetest3-i686.S',
  'swaptest-i686.S',
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
