{
  description = "A flake providing a devshell with Salesforce CLI";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    sfcli = pkgs.callPackage ./default.nix {};
    
  in {
    packages.${system} = {
      salesforce-cli = sfcli;
      default = sfcli;
    };
    
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [ sfcli ];
    };
  };
}