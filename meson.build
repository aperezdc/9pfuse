project('9pfuse', 'c',
  meson_version: '>=0.53',
  default_options: [
    'buildtype=debugoptimized',
    'b_ndebug=if-release',
    'c_std=c11',
  ],
  version: '1',
)

add_project_arguments('-DPLAN9_TARGET="@0@"'.format(get_option('prefix')), language: 'c')

cc = meson.get_compiler('c')
add_project_arguments(cc.get_supported_arguments(
    '-fcommon',
    '-Wno-dangling-else',
    '-Wno-missing-braces',
    '-Wno-parentheses',
  ),
  language: 'c',
)

extra_sources = []
getcallerpc_clang_gcc_check = '''
#if defined(__GNUC__) || defined(__clang__) || defined(__IBMC__)
int main(int argc, char **argv) { return (int) __builtin_return_address(0); }
#else
# error No built-in implementation
#endif
'''

if not cc.compiles(getcallerpc_clang_gcc_check)
  if target_machine.cpu_family() == 'x86_64'
    getcallerpc_impl = 'x86_64'
  elif target_machine.cpu_family() == 'x86'
    getcallerpc_impl = '386'
  elif target_machine.cpu_family() == 'arm'
    # Might work on aarch64, but it was not yet tested.
    getcallerpc_impl = 'arm'
  elif target_machine.cpu_family() == 'ppc'
    # Might work on ppc64, but it was not yet tested.
    getcallerpc_impl = 'power'
  else
    error('Target architecture unsupported: @0@'.format(target_machine.cpu_family()))
  endif
  extra_sources += ['compat/lib9/md/getcallerpc-@0@.c'.format(getcallerpc_impl)]
endif

executable('9pfuse',
  'errstr.c',
  'fuse.c',
  'main.c',
  'main_p9main.c',
  'compat/fmt/dofmt.c',
  'compat/fmt/fltfmt.c',
  'compat/fmt/fmt.c',
  'compat/fmt/fmtfd.c',
  'compat/fmt/fmtfdflush.c',
  'compat/fmt/fmtlocale.c',
  'compat/fmt/fmtlock.c',
  'compat/fmt/fmtprint.c',
  'compat/fmt/fmtquote.c',
  'compat/fmt/fmtstr.c',
  'compat/fmt/fprint.c',
  'compat/fmt/nan64.c',
  'compat/fmt/print.c',
  'compat/fmt/seprint.c',
  'compat/fmt/smprint.c',
  'compat/fmt/snprint.c',
  'compat/fmt/sprint.c',
  'compat/fmt/strtod.c',
  'compat/fmt/vfprint.c',
  'compat/fmt/vseprint.c',
  'compat/fmt/vsmprint.c',
  'compat/fmt/vsnprint.c',
  'compat/lib9/argv0.c',
  'compat/lib9/atexit.c',
  'compat/lib9/atnotify.c',
  'compat/lib9/atoi.c',
  'compat/lib9/await.c',
  'compat/lib9/cistrncmp.c',
  'compat/lib9/cistrstr.c',
  'compat/lib9/convD2M.c',
  'compat/lib9/convM2D.c',
  'compat/lib9/convM2S.c',
  'compat/lib9/convS2M.c',
  'compat/lib9/dial.c',
  'compat/lib9/dirmodefmt.c',
  'compat/lib9/dup.c',
  'compat/lib9/errstr.c',
  'compat/lib9/exitcode.c',
  'compat/lib9/fcallfmt.c',
  'compat/lib9/get9root.c',
  'compat/lib9/getenv.c',
  'compat/lib9/getuser.c',
  'compat/lib9/jmp.c',
  'compat/lib9/malloc.c',
  'compat/lib9/mallocz.c',
  'compat/lib9/netmkaddr.c',
  'compat/lib9/notify.c',
  'compat/lib9/nulldir.c',
  'compat/lib9/open.c',
  'compat/lib9/_p9dialparse.c',
  'compat/lib9/_p9dir.c',
  'compat/lib9pclient/close.c',
  'compat/lib9pclient/create.c',
  'compat/lib9pclient/dirread.c',
  'compat/lib9pclient/fs.c',
  'compat/lib9pclient/open.c',
  'compat/lib9pclient/read.c',
  'compat/lib9pclient/seek.c',
  'compat/lib9pclient/stat.c',
  'compat/lib9pclient/walk.c',
  'compat/lib9pclient/write.c',
  'compat/lib9pclient/wstat.c',
  'compat/lib9/pin.c',
  'compat/lib9/qlock.c',
  'compat/lib9/read9pmsg.c',
  'compat/lib9/readn.c',
  'compat/lib9/sendfd.c',
  'compat/lib9/sleep.c',
  'compat/lib9/strdup.c',
  'compat/lib9/strecpy.c',
  'compat/lib9/sysfatal.c',
  'compat/lib9/tokenize.c',
  'compat/lib9/waitpid.c',
  'compat/lib9/write.c',
  'compat/libmux/io.c',
  'compat/libmux/mux.c',
  'compat/libmux/queue.c',
  'compat/libthread/channel.c',
  'compat/libthread/daemonize.c',
  'compat/libthread/ioproc.c',
  'compat/libthread/iorw.c',
  'compat/libthread/pthread.c',
  'compat/libthread/ref.c',
  'compat/libthread/thread.c',
  'compat/utf/rune.c',
  'compat/utf/utfecpy.c',
  'compat/utf/utflen.c',
  'compat/utf/utfnlen.c',
  'compat/utf/utfrune.c',
  'compat/lrand.c',
  'compat/rand.c',
  extra_sources,
  dependencies: [
    dependency('fuse'),
    dependency('threads'),
  ],
  include_directories: include_directories('compat'),
  install: true,
)
