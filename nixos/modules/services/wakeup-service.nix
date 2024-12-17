{ config, pkgs, ... }:

{ ## This service executes command on each boot ##
 
  systemd.services.wakeup-service = {
    description = "Disable ACPI wakeup sources. Fix for GPD";
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;

      ## Script ##
      ExecStart = ''
        for i in $(cat /proc/acpi/wakeup | grep enabled | awk '{print $1}' | xargs); do
          case $i in
            SLPB|XHCI);;
            *) echo $i | tee /proc/acpi/wakeup;
          esac;
        done
      '';      
    };
  };

}
