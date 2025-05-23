{
  description = "Alex's System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nvim.url = "git+https://codeberg.org/signet-marigold/neovim";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flatpaks.url = "github:GermanBread/declarative-flatpak/stable-v3";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    pluvio.url = "github:signet-marigold/pluvio-flake";
  };

  outputs = { nixpkgs, home-manager, stylix, sops-nix, flatpaks, ... }@inputs:
  {
    nixosConfigurations = {
      AT20-CLEVELAND = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { _module.args = inputs; }

          home-manager.nixosModules.home-manager {
            home-manager = {
              backupFileExtension = "backup30";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.anhack.imports = [ ./home-manager/hosts/AT20-CLEVELAND ];
              extraSpecialArgs = { inherit inputs; };
            };
          }

          ./users/anhack
          ./hosts/AT20-CLEVELAND
          ./modules/base
          ./modules/system
          ./modules/desktop/targets/gnome-desktop

          ./modules/hardware/graphics/opengl-with-intel.nix
          ./modules/hardware/bluetooth.nix
          ./modules/hardware/logitech-wireless.nix
          #./modules/hardware/fingerprint-scanner.nix
          #./modules/hardware/power-management.nix
          ./modules/hardware/display.nix
          ./modules/hardware/sound.nix
          ./modules/hardware/usb.nix
          ./modules/hardware/ios-devices.nix
          ./modules/hardware/touchpad.nix

          ./modules/editors/neovim.nix
          ./modules/editors/kate.nix
          ./modules/editors/helix.nix
          ./modules/editors/vscodium.nix
          ./modules/editors/idea.nix

          ./modules/development/lsp.nix
          ./modules/development/programming-languages.nix
          ./modules/development/work.nix
          ./modules/development/utils.nix
          ./modules/development/rust.nix
          ./modules/development/wasm.nix

          ./modules/virtualisation.nix
          ./modules/steam.nix
          ./modules/flatpaks.nix

          ./modules/pia/pia-nm.nix
          ./modules/vpn.nix
        ];
      };
      AT08-OBAMA = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { _module.args = inputs; }

          home-manager.nixosModules.home-manager {
            home-manager = {
              backupFileExtension = "backup30";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.anhack.imports = [ ./home-manager/hosts/AT08-OBAMA ];
              extraSpecialArgs = { inherit inputs; };
            };
          }

          ./users/anhack
          ./hosts/AT08-OBAMA
          ./modules/base
          ./modules/system
          ./modules/desktop/targets/gnome-desktop

          ./modules/hardware/graphics/nvidia.nix
          ./modules/hardware/graphics/opengl.nix
          ./modules/hardware/bluetooth.nix
          ./modules/hardware/logitech-wireless.nix
          ./modules/hardware/display.nix
          ./modules/hardware/sound.nix
          ./modules/hardware/usb.nix
          ./modules/hardware/ios-devices.nix
          ./modules/hardware/bcm-wireless.nix

          ./modules/editors/neovim.nix
          ./modules/editors/kate.nix
          ./modules/editors/helix.nix
          ./modules/editors/vscodium.nix
          ./modules/editors/idea.nix

          ./modules/development/lsp.nix
          ./modules/development/programming-languages.nix
          ./modules/development/work.nix
          ./modules/development/utils.nix
          ./modules/development/rust.nix
          ./modules/development/wasm.nix

          ./modules/virtualisation.nix
          ./modules/steam.nix
          ./modules/proxychains.nix
          ./modules/i2p.nix
          ./modules/flatpaks.nix

          ./modules/pia/pia-nm.nix
          ./modules/vpn.nix
        ];
      };
    };
  };
}
