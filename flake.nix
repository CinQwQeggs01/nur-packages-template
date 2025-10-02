{
  description = "Alger Music Player package for NUR";

  inputs = {
   
    nixpkgs.url = "github:NixOS/nixpkgs/unstable"; 
  };

  outputs = { self, nixpkgs }: 
  let
    
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in 
  {
    
    packages.${system} = {
      
      algerMusicPlayer = pkgs.callPackage ./default.nix {};
    };
    
    
    defaultPackage.${system} = self.packages.${system}.algerMusicPlayer;
  };
}
