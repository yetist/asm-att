asm_sources = [
]

dynamic_sources = [
  'cfunctest-i686.S',
]

static_sources = [
  'nanotest-i686.S',
  'syscalltest1-i686.S',
  'syscalltest2-i686.S',
  'sysinfo-i686.S',
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
