# hust-software-security-project

A security analysis project for the Xpdf PDF reader, focusing on vulnerability discovery and comparing modern fuzzing and static/dynamic analysis techniques.

## Install prerequisites

```bash
# 1. Update system
sudo apt update

# 2. Install Build Tools
sudo apt install -y build-essential cmake git wget unzip clang llvm

# 3. Install Xpdf Dependencies (Bắt buộc)
sudo apt install -y libfreetype6-dev libfontconfig1-dev libpng-dev zlib1g-dev

# 4. Install Security Tools
sudo apt install -y afl++ radamsa cppcheck gdb
```

## Build from source

We have 2 modes for compiling

1. Mode 1: Build with AFL++ (For optimal fuzzing)

```bash
chmod +x scripts/build_afl.sh
./scripts/build_afl.sh
```

2 . Mode 2: Build with gcc (default)

```bash
chmod +x scripts/build_normal.sh
./scripts/build_normal.sh
```