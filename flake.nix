{
  description = "Alex's System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
    stylix.url = "github:danth/stylix";
    nvim.url = "git+https://codeberg.org/signet-marigold/neovim";
    agenix.url = "github:ryantm/agenix";
    pia.url = "git+https://git.sr.ht/~rprospero/nixos-pia?ref=development";
    pia.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  {
    nixosConfigurations = {
      AT20-CLEVELAND = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { _module.args = inputs; }
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.anhack = import ./home-manager/hosts/AT20-CLEVELAND;
              extraSpecialArgs = {};
            };
          }
          ./users/anhack.nix
          ./hosts/AT20-CLEVELAND
          ./modules/base
          ./modules/system
          ./modules/desktop/targets/dwm-desktop
          ./modules/login/lightgreet.nix
          ./modules/hardware/graphics/opengl-with-intel.nix
          ./modules/hardware/bluetooth.nix
          #./modules/hardware/fingerprint-scanner.nix
          # ./modules/hardware/power-management.nix
          ./modules/hardware/screen.nix
          ./modules/hardware/sound.nix
          ./modules/hardware/usb.nix
          #./modules/hardware/yubikey.nix
          ./modules/editors/neovim.nix
          ./modules/editors/kate.nix
          ./modules/development/lsp.nix
          ./modules/development/programming-languages.nix
          ./modules/development/work.nix
          ./modules/development/utils.nix
          ./modules/development/rust.nix
          ./modules/development/wasm.nix
          ./modules/info-fetchers.nix
          ./modules/terminal-utils.nix
          ./modules/virtualisation.nix
          ./modules/vpn.nix
          ./modules/steam.nix
        ];
      };
      AT08-OBAMA = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { _module.args = inputs; }
          inputs.stylix.nixosModules.stylix
          inputs.agenix.nixosModules.default
          inputs.pia.nixosModule
          home-manager.nixosModules.home-manager {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.anhack = import ./home-manager/hosts/AT08-OBAMA;
              extraSpecialArgs = {};
            };
          }
          ./users/anhack.nix
          ./hosts/AT08-OBAMA
          ./modules/base
          ./modules/system
          ./modules/desktop/targets/dwm-desktop
          ./modules/login/lightgreet.nix
          ./modules/hardware/graphics/nvidia.nix
          ./modules/hardware/graphics/opengl.nix
          ./modules/hardware/bluetooth.nix
          #./modules/hardware/fingerprint-scanner.nix
          # ./modules/hardware/power-management.nix
          ./modules/hardware/screen.nix
          ./modules/hardware/sound.nix
          ./modules/hardware/usb.nix
          #./modules/hardware/yubikey.nix
          ./modules/editors/neovim.nix
          ./modules/editors/kate.nix
          ./modules/development/lsp.nix
          ./modules/development/programming-languages.nix
          ./modules/development/work.nix
          ./modules/development/utils.nix
          ./modules/development/rust.nix
          ./modules/development/wasm.nix
          ./modules/info-fetchers.nix
          ./modules/terminal-utils.nix
          ./modules/virtualisation.nix
          ./modules/vpn.nix
          ./modules/steam.nix
        ];
      };
    };
  };
}
