{ pkgs, libs, vars, ... }:

{
  ### Change owner of /mnt/homedisk. Temp solution. ###
  systemd.services.changeOwnerHomedisk = {
    description = "Change owner of /mnt/homedisk";
    wantedBy = [ "multi-user.target" ];
    after = [ "local-fs.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/chown -R ${vars.user}:1000 /mnt/homedisk";
      # RemainAfterExit = true;
    };
  };
}
