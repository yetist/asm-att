asm_sources = [
  'regdump.S',
]

c_sources = [
  'regdump.c',
]

sources = c_sources

libcommon = shared_library(
  'common',
  sources,
  link_args: lib_link_args,
  build_rpath: rpath,
  )
#
#static_sources = [
#  'hello.S',
#]
#
#dynamic_sources = [
#]
#
#foreach src: static_sources
#  base = src.split('.')[0]
#  executable(base,
#    src,
#    link_args: gas_link_args,
#  )
#endforeach
#
#foreach src: dynamic_sources
#  base = src.split('.')[0]
#  executable(base,
#    src,
#    link_args: lib_link_args,
#    build_rpath: rpath,
#  )
#endforeach
