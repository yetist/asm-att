static_sources = [
]

dynamic_sources = [
]

asm_sources = [
  'circle_fpu_87.asm',
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
    asm_gen.process('reverse-x86_64.asm'),
    link_args: gas_link_args,
  )
endforeach
