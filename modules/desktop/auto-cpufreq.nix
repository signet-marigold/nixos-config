{
  # Intel CPUs only. prevents overheating
  services.thermald.enable = true;

  # Power management
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      govenor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
}
