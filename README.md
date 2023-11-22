9pfuse
======

This is a standalone version of `9pfuse`, a FUSE client for the 9P protocol
as included in [Plan9 Port](http://swtch.com/plan9port). The source code has
been imported from the `src/cmd/9pfuse` directory of the repository, adding
the minimum set of needed sources from `src/lib9`, `src/libthread` and
`src/lib9pclient` directories to make it build correctly.


Building 9pfuse
---------------

As a bonus, [Meson](https://mesonbuild.com)-based build system tested to work
under recent GNU/Linux sustems has been included: just run the usual `meson
setup build && meson compile -Cbuild` incantation from the source directory.

