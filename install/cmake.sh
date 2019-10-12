if ! is-macos -o ! is-executable make -o ! is-executable wget; then
  echo "Skipped: CMake (missing: make and/or wget)"
  return
fi

wget https://github.com/Kitware/CMake/releases/download/v3.15.4/cmake-3.15.4.tar.gz

tar -xf cmake-3.15.4.tar.gz -C /tmp

cd /tmp/cmake-3.15.4 && ./configure && make && sudo make install && cd -
rm -rf /tmp/cmake-3.15.4
rm cmake-3.15.4.tar.gz