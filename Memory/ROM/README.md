The "generic_ROM" inits it self my reading any file.txt.
It can be sythetized in two ways:
- OFFSET_USE:"no". In this configuration the ROM is non addressable and every address is self generated end self incremented every clock cycle if the enable is asserted. Starting from 0 and going all the way down to the end of the memory.
- OFFSET_USE:"yes". In this configuration is it possible to set a star address and a number of locations, called "Offset", to compute the final address.
