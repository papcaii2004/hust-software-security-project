#!/bin/bash
# scripts/build_normal.sh

set -e

echo "[*] [GCC] Starting Build Process - NO GUI MODE..."

rm -rf build_normal
mkdir build_normal
cd build_normal

export CC=gcc
export CXX=g++

# Use gcc
cmake ../xpdf-4.00/src \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_DISABLE_FIND_PACKAGE_Qt4=1 \
  -DCMAKE_DISABLE_FIND_PACKAGE_Qt5Widgets=1 \
  -DCMAKE_CXX_FLAGS="-std=c++11"

echo "[*] Compiling..."
make -j$(nproc)

echo ""
echo "------------------------------------------------"
echo "[SUCCESS] Build Normal (GCC) Complete!"
echo "Target Binary: $(pwd)/xpdf/pdftotext"
echo "------------------------------------------------"