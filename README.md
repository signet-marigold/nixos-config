# ANHACK's Nixos Config

originally based on [xnm1's config](https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles)

- WM: dwm
- Bar: slstatus

## Screenshots

![everything](.github/assets/screenshot3.png)

![minimal](.github/assets/screenshot4.png)

| | |
| - | - |
| modified modules go in | `hosts` |
| anything having to do with the filesystem goes in | `home-manager:hosts` |
| and same thing goes for the user; if its user specific it goes in | `users:user` or `home-manager:users:user` |

and so we have a *mostly* mirrored desktop for any and all devices i want

## Structure
```
. {tree as of 2024-10-09}
├── LICENSE
├── README.md
├── flake.lock
├── flake.nix
├── home-manager
│   ├── hosts
│   │   ├── AT08-OBAMA
│   │   │   └── ...
│   │   └── AT20-CLEVELAND
│   │       └── ...
│   ├── modules
│   │   └── ...
│   └── users
│       └── anhack
├── hosts
│   ├── AT08-OBAMA
│   │   ├── configuration.nix
│   │   ├── default.nix
│   │   ├── display-setup.nix
│   │   ├── hardware-configuration.nix
│   │   └── modules
│   │       └── ...
│   └── AT20-CLEVELAND
│       ├── configuration.nix
│       ├── default.nix
│       ├── display-setup.nix
│       ├── hardware-configuration.nix
│       └── modules
│           └── ...
├── modules
│   ├── base
│   ├── system
│   ├── hardware
│   ├── editors
│   ├── development
│   └── desktop
│       ├── ...
│       └── targets
│           ├── dwm-desktop
│           ├── gnome-desktop
│           ├── hyprland-desktop
│           └── kde-desktop
├── users
│   └── anhack
└── wallpapers
    └── background_black.png
```

## More info
(ps) i could not recomend trying to run this config without heavy modification

### but if you do here are some things to keep in mind:

1. main user is `anhack`
so change that name everywhere; just make sure it matches the primary user when you installed nixos.

1. if you don't replace `hardware-configuration.nix` in the `hosts` section
then you will not be able to load nixos because it will try to use the wrong drives.
i have messed that up myself a few times

## Install

1. in the `nixos-config` directory run `sudo nixos-rebuild switch --flake .#<HOST>` e.g. `sudo nixos-rebuild switch --flake .#AT08-OBAMA`

1. run `inital-setup.sh`, this helper script sets up the home directory tree for the default user and sets the nixos channel

### Notes:

i've had a few systemd targets fail when installing everything. rerunning the command overcame the error

oh and set the default channel. fish auto compleations don't work without

`sudo nix-channel --update nixos`

### Post install:

#### Setup sops

generate ssh key

`ssh-keygen -t ed25519 -C "perad@sqwu.me"`

use ssh key to make sops key

`nix run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt`

get public key from that sops key

`nix shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt`

will be a long string like this

`ageXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`

place that string into .sops.yaml

all together

mkdir -p ~/.config/sops/age/ && nix --extra-experimental-features nix-command --extra-experimental-features flakes run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt && nix --extra-experimental-features nix-command --extra-experimental-features flakes shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt

#### first command chain

`mkdir -p Repos`

`cd Repos`

`nix-shell -p git --run "git clone https://codeberg.org/signet-marigold/nixos-config"`

`cd nixos-config`

`bash ./inital-setup.sh`

#### You are probably going to have to restart after all this

### TODO:

- vpn on wifi passthrough dns has no resolve; temp change resolv.conf to cloudflare/google to fix

    - could be related to custom dns solution on home network
