#!/bin/bash
# scripts/build_afl.sh

set -e

echo "[*] [AFL++] Starting Build Process - NO GUI MODE..."

# 1. ENV for afl
export LLVM_CONFIG="llvm-config"
export CC=afl-clang-fast
export CXX=afl-clang-fast++

# Use ASAN for memory bugs detect
export AFL_USE_ASAN=1

# 2. Tạo thư mục build sạch
rm -rf build_afl
mkdir build_afl
cd build_afl

# 3. Config CMake (IMPORTANT: Disable Qt)
# -DCMAKE_DISABLE_FIND_PACKAGE_Qt4=1
# -DCMAKE_DISABLE_FIND_PACKAGE_Qt5Widgets=1 : 
# -fsanitize=address : Enable AddressSanitizer

echo "[*] Configuring CMake (Headless - CLI Tools Only)..."
cmake ../xpdf-4.00/src \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_DISABLE_FIND_PACKAGE_Qt4=1 \
  -DCMAKE_DISABLE_FIND_PACKAGE_Qt5Widgets=1 \
  -DCMAKE_C_FLAGS="-fsanitize=address -g -I/usr/include/freetype2" \
  -DCMAKE_CXX_FLAGS="-fsanitize=address -g -std=c++11 -I/usr/include/freetype2" \
  -DCMAKE_EXE_LINKER_FLAGS="-fsanitize=address" \
  -DHAVE_FREETYPE_H=1

# 4. Compile
echo "[*] Compiling..."
make -j$(nproc)

echo ""
echo "------------------------------------------------"
echo "[SUCCESS] Build AFL++ Complete!"
echo "Target Binary Location:"
echo "  - Text Extractor:  $(pwd)/xpdf/pdftotext"
echo "  - Info Tool:       $(pwd)/xpdf/pdfinfo"
echo "  - Image Extractor: $(pwd)/xpdf/pdftopng"
echo "------------------------------------------------"