# Toyimk
A demo input method for macOS based on Swift and CMake,
forked from [ensan-hcl/macOS_IMKitSample_2021](https://github.com/ensan-hcl/macOS_IMKitSample_2021).

This project is for developers who don't like deprecated Objective-C and ugly `.xcodeproj`.

## Install dependencies
```sh
brew install swiftlint ninja
pip install "dmgbuild[badge_icons]"
```

## Build
```sh
cmake -B build -G Ninja \
  -DARCH=[native|x86_64|arm64] \
  -DCMAKE_BUILD_TYPE=Release
cmake --build build
```

## Install
Either open `build/Toyimk.dmg`
(if prompted Toyimk is in use error,
execute `pkill Toyimk` and retry), or
```sh
sudo cmake --install build
```
* On first time installation,
logout your account and login,
then in `System Settings` -> `Keyboard` -> `Input Sources`,
add `Toyimk` from `English`.
* On further installations,
switch to another input method,
`pkill Toyimk`,
then switch back.
* You may change what is committed at `client.insert` in [controller.swift](src/controller.swift) to make sure your changes take effect.

## Debug
Yes, though being a system module, input method is debuggable.
However, you need another machine to do it.
```sh
$ ssh your-mac
$ /usr/bin/lldb
(lldb) process attach --name Toyimk
(lldb) b inputText
(lldb) c
```
Now switch to Toyimk and hit a key.
