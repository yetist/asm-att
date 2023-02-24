#static_sources = [
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

test_regdump = executable('test_regdump',
  'test.S',
    link_args: lib_link_args,
    build_rpath: rpath,
    link_with: libcommon,
)
