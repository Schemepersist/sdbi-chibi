# sdbi-chibi
Chibi Scheme implementation of the Scheme Database Interface (sdbi)

The Makefile does not assume an installed Chibi Scheme is the correct
version to build from, you must set the environment variable
CHIBI_LOCATION_PATH to the desired location.

Without modifying your environment, with gmake being Gnu Make or some
sort of alias to it, you could execute something like this using bash:

CHIBI_LOCATION_PATH=/home/src/chibi-scheme gmake

To run with all paths set correctly, from the top repo directory,
execute somethin like this:

LD_LIBRARY_PATH="/home/src/chibi-scheme:." DYLD_LIBRARY_PATH="/home/src/chibi-scheme:." CHIBI_IGNORE_SYSTEM_PATH=1 CHIBI_MODULE_PATH="/home/src/chibi-scheme/lib:./lib" /home/src/chibi-scheme/chibi-scheme
