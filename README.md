# ANHACK's Nixos Config

originally based on [xnm1's config](https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles)

large credit goes to them when i was learning nix

- WM: dwm
- Bar: slstatus

## Screenshots

![everything](.github/assets/screenshot1.png)

![minimal](.github/assets/screenshot2.png)

this is designed for *two* hosts (`AT08-OBAMA` & `AT20-CLEVELAND`) both with the username `anhack`

the idea is that : `as much as possible` is the same between the hosts

now there *are* exception. a few settings are hardware specific or otherwise limited because of hardware

| | |
| - | - |
| modified modules go in | `hosts` |
| anything having to do with the filesystem goes in | `home-manager:hosts` |
| and same thing goes for the user; if its user specific it goes in | `users:user` or `home-manager:users:user` |

and so we have a *mostly* mirrored desktop for any and all devices i want

## Structure
```
.
├── hosts
│   ├── AT20-CLEVELAND
│   │   └── modules
│   │       └── slstatus
│   └── AT08-OBAMA
│       └── modules
│           └── slstatus
├── modules
│   ├── desktop
│   │   ├── dmenu
│   │   │   └── patches
│   │   ├── st
│   │   │   └── patches
│   │   ├── dwm
│   │   │   └── patches
│   │   └── targets
│   │       ├── dwm-desktop
│   │       │   └── packages
│   │       │       ├── hhst
│   │       │       └── dhst
│   │       ├── gnome-desktop
│   │       ├── kde-desktop
│   │       └── hyprland-desktop
│   ├── editors
│   │   └── neovim
│   │       └── config
│   ├── hardware
│   │   └── graphics
│   ├── development
│   ├── login
│   ├── base
│   └── system
├── home-manager
│   ├── users
│   │   └── anhack
│   │       └── modules
│   │           ├── piper-tts
│   │           └── browsers
│   └── hosts
│       ├── AT20-CLEVELAND
│       │   └── modules
│       │       └── conky
│       └── AT08-OBAMA
│           └── modules
│               └── conky
└── users ─ anhack.nix
```

## More info
(ps) i could not recomend trying to run this config without heavy modification

but if you do here are some things to keep in mind:

1. main user is `anhack` i have plenty of things all over that rely on that.
so change that username everywhere; just make sure it matches the primary user when you installed nixos.

1. **Big Warning** for this one.; if you don't replace `hardware-configuration.nix` in the `hosts` section (you get a fresh one that matches your hardware and install setup at `/etc/nixos/hardware-config.nix`)
then you will not be able to load nixos because it will try to use the wrong drives.
i have messed that up myself a few times

in the `nixos-config` directory run `sudo nixos-rebuild switch --flake .#<HOST>` e.g. `sudo nixos-rebuild switch --flake .#AT08-OBAMA`

i've had a few systemd targets fail when installing everything. rerunning the command overcame the error
