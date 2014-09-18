9pfuse
======

[![Build Status](https://drone.io/github.com/aperezdc/9pfuse/status.png)](https://drone.io/github.com/aperezdc/9pfuse/latest)

This is a standalone version of `9pfuse`, a FUSE client for the 9P protocol
as included in [Plan9 Port](http://swtch.com/plan9port). The source code has
been imported from the `src/cmd/9pfuse` directory of the repository, adding
the minimum set of needed sources from `src/lib9`, `src/libthread` and
`src/lib9pclient` directories to make it build correctly.


Building 9pfuse
---------------

As a bonus, a ready-to-use `Makefile` that will work under recent GNU/Linux
sustems has been included: just run `make` from the source directory.

