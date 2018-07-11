static_sources = [
  'hello.S',
  'hello2.S',
]

dynamic_sources = [
  'hello3.S',
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
  )
endforeach
