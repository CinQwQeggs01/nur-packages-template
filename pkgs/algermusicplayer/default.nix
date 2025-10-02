{ lib, pkgs, appimageTools, fetchurl, ... }:

let
  version = "4.9.0"; 
  pname = "AlgerMusicPlayer";
  src = fetchurl {
    url = https://github.com/algerkong/AlgerMusicPlayer/releases/download/v4.9.0/AlgerMusicPlayer-4.9.0-linux-x86_64.AppImage; 
    sha256 = sha256:7d8f25a1bb118369c310d60363747cd73276c7416bdbdbc971cade95b7608268; # 替
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

extraPkgs = pkgs: with pkgs; [
  libglvnd
  ffmpeg
  qt5.qtbase 
];
  
