static_sources = [
]

dynamic_sources = [
  'add-sub.S',
  'addi.S',
  'alsl.S',
  'luxxi.S',
  'slt.S',
  'pcadd.S',
  'and-or.S',
  'mul.S',
  'div-mod.S',
]

foreach src: static_sources
  base = src.split('.')[0]
  executable(base,
    src,
    link_args: gas_link_args,
  )
endforeach

foreach src: dynamic_sources
  base = src.split('.')[0]
  executable(base,
    src,
    link_args: lib_link_args,
    build_rpath: rpath,
    link_with: libcommon,
  )
endforeach
