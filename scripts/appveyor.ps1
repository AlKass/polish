if ($env:PLATFORM -eq "x86") {
    $arch = "i686"
}
else {
    $arch = "x86_64"
}

$rust_version = $env:RUST_VERSION
$rust_install = "rust-$rust_version-$arch-pc-windows-gnu.msi"
Start-FileDownload "https://static.rust-lang.org/dist/$rust_install" -FileName $rust_install
Start-Process -FilePath msiexec -ArgumentList /i, $rust_install, /quiet, INSTALLDIR="C:\Rust" -Wait
$env:Path = $env:Path + ";C:\Rust\bin"
rustc -vV

set PATH=C:\msys64\mingw%BITS%\bin;C:\msys64\usr\bin;%PATH%
if defined MINGW_URL appveyor DownloadFile %MINGW_URL%/%MINGW_ARCHIVE%
if defined MINGW_URL 7z x -y %MINGW_ARCHIVE% > nul
if defined MINGW_URL set PATH=%CD%\%MINGW_DIR%\bin;C:\msys64\usr\bin;%PATH%

appveyor-retry appveyor DownloadFile https://win.rustup.rs/ -FileName rustup-init.exe
rustup-init.exe -y --default-host x86_64-pc-windows-msvc --default-toolchain nightly-2017-03-03
set PATH=%PATH%;C:\Users\appveyor\.cargo\bin
if NOT "%TARGET%" == "x86_64-pc-windows-msvc" rustup target add %TARGET%
if defined OTHER_TARGET rustup target add %OTHER_TARGET%
rustc -V
cargo -V
git submodule update --init
