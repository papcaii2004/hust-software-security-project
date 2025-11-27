# hust-software-security-project

A security analysis project for the Xpdf PDF reader, focusing on vulnerability discovery and comparing modern fuzzing and static/dynamic analysis techniques.

## 🛠️ Project Target

- **Software:** Xpdf v4.00 (Old Release)
- **Target Component:** Command Line Utilities (pdftotext, pdfinfo, pdftopng)
- **Primary Goal:** Finding memory corruption bugs (ASan) and logic flaws (Cppcheck).

## Install prerequisites

## 🚀 Installation & Setup

> These instructions are run on a fresh `Ubuntu Linux 24.04`

```bash
# 1. Update system
sudo apt update

# 2. Install Build Tools (gcc, clang, cmake)
sudo apt install -y build-essential cmake git wget unzip clang llvm

# 3. Install Xpdf Dependencies (Fix Linker Errors)
sudo apt install -y libfreetype6-dev libfontconfig1-dev libpng-dev zlib1g-dev libtiff-dev liblcms2-dev libjpeg-dev

# 4. Install Security Tools (Fuzzing/Static/Debug)
sudo apt install -y afl++ radamsa cppcheck gdb
```

## Build from source


- Clone this repo
```bash
git clone https://github.com/papcaii2004/hust-software-security-project.git
```

- We have 2 modes for compiling

  - Mode 1: Build with gcc (default)

```bash
chmod +x scripts/build_normal.sh
./scripts/build_normal.sh
```

  - Mode 2: Build with AFL++ (For optimal fuzzing)

```bash
chmod +x scripts/build_afl.sh
./scripts/build_afl.sh
```

