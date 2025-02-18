{ pkgs, config, libs, ... }:


{ ## TLP Program Settings ##

  services.tlp = {
    enable = true;
    settings = {
      
      #CPU_SCALING_GOVERNOR_ON_AC = "performance";
      #CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      #CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      #CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      #CPU_MIN_PERF_ON_AC = 0;
      #CPU_MAX_PERF_ON_AC = 90;
      #CPU_MIN_PERF_ON_BAT = 0;
      #CPU_MAX_PERF_ON_BAT = 50;

     #START_CHARGE_THRESH_BAT0 = 40; # bellow it starts to charge
     STOP_CHARGE_THRESH_BAT0 = 85; # above it stops charging

    };
  };

  # TLP Service is in conflict with power-profiles-damon #
  # Be sure to disable it #
  services.power-profiles-daemon.enable = false;

}  
