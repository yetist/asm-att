asm_sources = [
]

dynamic_sources = [
]

static_sources = [
  'cpuidfile.s',
  'readtest1.s',
  'readtest2.s',
]

c_sources = [
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

executable('fileconvert',
  'fileconvert.s',
  'sizefunc.s',
  'convert.s',
  c_args: c_args,
  link_args: gas_link_args,
  build_rpath: rpath,
)

#executable('readtest3',
#  'readtest3.s',
#  'sizefunc.s',
#  'convert.s',
#  c_args: c_args,
#    link_args: gas_link_args,
#  build_rpath: rpath,
#)

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
