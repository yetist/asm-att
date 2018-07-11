asm_sources = [
]

dynamic_sources = [
]

static_sources = [
]

c_sources = [
  'calctest.c',
  'condtest.c',
  'csetest.c',
  'sums.c',
  'tempconv.c',
  'vartest.c',
]

foreach src: c_sources
  base = src.split('.')[0]
  executable(base,
    src,
    c_args: c_args,
    link_args: ['-m32', '-no-pie'],
    build_rpath: rpath,
  )
endforeach

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
