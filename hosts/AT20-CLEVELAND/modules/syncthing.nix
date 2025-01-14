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
          "obama" = { id = "GWEJU5Y-HT72MOQ-7YWVKXV-HEOERFH-WIJUQK7-I5TL7VS-FF3Y6RU-ABRDNAP"; };
          "legion" = { id = "D2CEMRJ-G3EDV7K-A636OMT-FOEPC4D-VGVIBI3-H2MQJYU-LAGWSXZ-2KXZLQ3"; };
          "frankee" = { id = "G6NJ4VD-LHNF3D6-BH3HMZV-2OSZ624-W6AOGPN-QSLOJ34-HIIXKJJ-SKQFNQO"; };
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
            devices = [ "lincoln" "obama" "legion" "frankee" ];
          };
          "Music" = {
            path = "/home/anhack/Music";
            devices = [ "obama" ];
          };
        };
        gui = { # Set login creds for web browser gui
          user = "username";
          password = "password";
        };
      };
    };
  };
}
