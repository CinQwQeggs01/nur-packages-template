{ lib, pkgs, appimageTools, fetchurl, ... }:

let
  version = "4.9.0";
  pname = "AlgerMusicPlayer";
  src = fetchurl {
    url = "https://github.com/algerkong/AlgerMusicPlayer/releases/download/v${version}/AlgerMusicPlayer-${version}-linux-x86_64.AppImage";
    sha256 = "7d8f25a1bb118369c310d60363747cd73276c7416bdbdbc971cade95b7608268";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = pkgs: with pkgs; [
    libglvnd
    ffmpeg
    qt5.qtbase
  ];

  meta = with lib; {
    description = "A powerful cross-platform music player based on Electron";
    homepage = "https://github.com/algerkong/AlgerMusicPlayer";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
} 
