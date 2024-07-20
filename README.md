# anhack's nixos config

- WM: dwm
- Bar: slstatus
- DM: lightdm

this is designed for *two* hosts (`at08-obama` & `at20-cleveland`) both with the username `anhack`

```
.
├── flake.lock
├── flake.nix
├── hosts
│   └── <HOST NAME>
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       ├── home.nix
│       ├── modules
│       │   └── <...>
│       └── sls-headers
│           └── <...>
├── modules
│   ├── dmenu-patches
│   │   └── <...>
│   ├── dwm-patches
│   │   └── <...>
│   └── <...>
└── sls-headers
    └── <...>

```

flake.nix defines both hostnames and what modules are loaded

and per host a home-manager hook loads settings from `hosts/<HOST NAME>/home.nix`

most of the work is being done by the module files

---

the user is set up at 

`hosts/<HOST NAME>/modules/user.nix`  
and  
`hosts/<HOST NAME>/home.nix`
