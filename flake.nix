{
  description = "A flake providing a devshell with Salesforce CLI";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    
  in {
    packages.${system}.salesforce-cli = pkgs.callPackage ./default.nix {};

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [ self.packages.${system}.salesforce-cli ];
    };
  };
}