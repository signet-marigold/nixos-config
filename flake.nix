{
  description = "anhack's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:
  {
    nixosConfigurations = {


      AT20-CLEVELAND = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/AT20-CLEVELAND/configuration.nix
          ./hosts/AT20-CLEVELAND/hardware-configuration.nix
          
          ./hosts/AT20-CLEVELAND/modules/mac-randomize.nix
          ./hosts/AT20-CLEVELAND/modules/open-ssh.nix
          ./hosts/AT20-CLEVELAND/modules/networking.nix
          ./hosts/AT20-CLEVELAND/modules/users.nix
          ./hosts/AT20-CLEVELAND/modules/slstatus.nix
          
          ./modules/power-management.nix
          ./modules/opengl.nix
          #./modules/fingerprint-scanner.nix
          ./modules/sound.nix
          ./modules/usb.nix
          ./modules/time.nix
          ./modules/swap.nix
          ./modules/bootloader.nix
          ./modules/nix-settings.nix
          ./modules/nixpkgs.nix
          ./modules/gc.nix
          ./modules/linux-kernel.nix
          ./modules/screen.nix
          ./modules/theme.nix
          ./modules/fonts.nix
          ./modules/security-services.nix
          ./modules/services.nix
          ./modules/printing.nix
          ./modules/dwm.nix
          ./modules/dmenu.nix
          ./modules/st.nix
          ./modules/bluetooth.nix
          ./modules/virtualisation.nix
          ./modules/programming-languages.nix
          ./modules/lsp.nix
          ./modules/rust.nix
          ./modules/wasm.nix
          ./modules/info-fetchers.nix
          ./modules/utils.nix
          ./modules/terminal-utils.nix
          ./modules/steam.nix
          ./modules/firewall.nix
          ./modules/dns.nix
          # ./modules/auto-upgrade.nix
          
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.anhack = import ./hosts/AT20-CLEVELAND/home.nix;
              extraSpecialArgs = {};
            };
          }
        ];
      };


      AT08-OBAMA = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/AT08-OBAMA/configuration.nix
          ./hosts/AT08-OBAMA/hardware-configuration.nix
          
          ./hosts/AT08-OBAMA/modules/open-ssh.nix
          ./hosts/AT08-OBAMA/modules/networking.nix
          ./hosts/AT08-OBAMA/modules/users.nix
          ./hosts/AT08-OBAMA/modules/slstatus.nix
          
          ./modules/nvidia.nix
          ./modules/opengl.nix
          #./modules/fingerprint-scanner.nix
          ./modules/sound.nix
          ./modules/usb.nix
          ./modules/time.nix
          ./modules/swap.nix
          ./modules/bootloader.nix
          ./modules/nix-settings.nix
          ./modules/nixpkgs.nix
          ./modules/gc.nix
          ./modules/linux-kernel.nix
          ./modules/screen.nix
          ./modules/theme.nix
          ./modules/fonts.nix
          ./modules/security-services.nix
          ./modules/services.nix
          #./modules/printing.nix
          ./modules/dwm.nix
          ./modules/dmenu.nix
          ./modules/st.nix
          ./modules/bluetooth.nix
          ./modules/virtualisation.nix
          ./modules/programming-languages.nix
          ./modules/lsp.nix
          ./modules/rust.nix
          ./modules/wasm.nix
          ./modules/info-fetchers.nix
          ./modules/utils.nix
          ./modules/terminal-utils.nix
          ./modules/steam.nix
          ./modules/firewall.nix
          ./modules/dns.nix
          # ./modules/auto-upgrade.nix
          
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.anhack = import ./hosts/AT08-OBAMA/home.nix;
              extraSpecialArgs = {};
            };
          }
        ];
      };


    };
  };
}
