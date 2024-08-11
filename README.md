# ANHACK's Nixos Config

based loosly on [xnm1's config](https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles)

- WM: dwm
- Bar: slstatus

this is designed for *two* hosts (`AT08-OBAMA` & `AT20-CLEVELAND`) both with the username `anhack`

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
│   │       └── dwm-desktop
│   │           └── packages
│   │               ├── hhst
│   │               └── dhst
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
│   └── modules
│       ├── piper-tts
│       └── browsers
└── users
```

## Screenshots

![everything](.github/assets/screenshot1.png)
