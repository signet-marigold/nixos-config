{
  services = {
    syncthing = {
      enable = true;
      group = "users";
      user = "anhack";
      dataDir = "/home/anhack/Documents";
      configDir = "/home/anhack/Documents/.config/syncthing";
      overrideDevices = true;    # overrides any devices added or deleted through the WebUI
      overrideFolders = true;    # overrides any folders added or deleted through the WebUI
      settings = {
        devices = {
          "lincoln" = { id = "VA4WEIQ-DSLHL6V-HAGESHS-3SBT4NV-6NBUM4V-QKU2JF7-IQQLFGI-YHEU5AJ"; };
          #"cleveland" = { id = "DEVICE-ID-GOES-HERE"; };
        };
        folders = {
          #"Documents" = {         # Name of folder in Syncthing, also the folder ID
          #  path = "/home/anhack/Documents";    # Which folder to add to Syncthing
          #  devices = [ "device1" "device2" ];      # Which devices to share the folder with
          #};
          #"Example" = {
          #  path = "/home/anhack/Example";
          #  devices = [ "device1" ];
          #  ignorePerms = false;  # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
          #};
          "Share" = {
            path = "/home/anhack/Share";
            devices = [ "lincoln" ];
          };
        };
      };
    };
  };
}
