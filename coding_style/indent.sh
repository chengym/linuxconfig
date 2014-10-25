#!/bin/sh
sudo sync;
echo "run indent";
dos2unix *.c
dos2unix *.h
indent -i4 -bli0 -nut -npsl -npcs -br -ce -lp -cli4 -il0 -l80 *.c;
indent -i4 -bli0 -nut -npsl -npcs -br -ce -lp -cli4 -il0 -l80 *.h;
sudo rm -rf *~;
sudo sync;
