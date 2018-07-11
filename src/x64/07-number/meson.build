static_sources = [
  'convtest.S',
  'mmxtest.S',
  'sse2float.S',
  'ssefloat.S',
  'ssetest.S',
]

dynamic_sources = [
]

asm_sources = [
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
  )
endforeach

foreach src: asm_sources
  base = src.split('.')[0]+'-asm'
  executable(base,
    asm_gen.process(src),
    link_args: gas_link_args,
  )
endforeach
