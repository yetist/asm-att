sources = [
  #'input-mips64el.S',
  #'strcmp-mips64el.S',
  #'h.s',
]

lib_sources = [
  #'z-mips.S',
  #'hello-mips.S',
]

foreach src: sources
  base = src.split('.')[0]
  executable(base,
    src,
    link_args: gas_link_args,
  )
endforeach

foreach src: lib_sources
  base = src.split('.')[0]
  executable(base,
    src,
    c_args: c_args,
    link_args: lib_link_args,
    #build_rpath: rpath,
    )
endforeach

#conf = configuration_data()
#conf.set('HELLO', 0)
#
#config_file = configure_file(
#  output: 'config.asm',
#  configuration: conf,
#  output_format: 'nasm',
#)

exe = executable('casm',
  'casm.c',
  asm_gen.process('casm.asm'),
  link_args: ['-nostdlib', '-lc'],
  #link_args: gas_link_args,
  #link_args: link_args,
)

#exe2 = executable('hello2',
#  objects : exe.extract_all_objects(),
#  link_args: link_args,
#)
#
#test('test-nasm-extract-all-objects', exe2)

#executable('hello',
#  'hello-i686.S',
#  #gas_gen.process('hello-i686.S'),
#  #c_args: link_args,
#  #link_args: [link_args, '-nostdlib'],
#  c_args: c_args,
#  link_args: gas_link_args,
#  #build_rpath: meson.get_cross_property('root'),
#)
