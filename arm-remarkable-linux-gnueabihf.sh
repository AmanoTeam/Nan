#!/bin/bash

declare extra_configure_flags='--with-cpu=cortex-a9 --with-fpu=neon --with-float=hard --with-mode=thumb'

declare triplet='arm-remarkable-linux-gnueabihf'

# https://web.archive.org/web/0if_/https://github.com/koreader/koxtoolchain/releases/latest/download/remarkable.zip
declare sysroot='https://github.com/koreader/koxtoolchain/releases/latest/download/remarkable.zip'
