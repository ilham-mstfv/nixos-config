{ pkgs, config, libs, ... }:

{ ### Firewall settings ### 
  networking.firewall = { 
    enable = true;
    
    allowedTCPPorts = [ 
      ## Syncthing ## 
      22000 32857
      
      ## Ventoy ##
      26000 16000 10809
    ];

    allowedUDPPorts = [ 
      ## Syncthing ## 
      22000 32857 21027
      
      ## Ventoy ##
      67 68 69 
    ];
  };
}
