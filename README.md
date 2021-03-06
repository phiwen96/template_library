# template_library

cmake -S . -B xbuild -GXcode && cmake --open xbuild


cmake -S . -B xbuild -GXcode

rm -rf xbuild/*



cmake -S . -B build

cmake --build build

cpack -G DragNDrop

