{ config, ... }:

{
  # NVIDIA GPU drivers
  services.switcherooControl.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    # Modesetting is critical for Wayland support
    modesetting.enable = true;

    # Enable power management features for NVIDIA GPUs, including fine-grained power management.
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Enable the NVIDIA settings menu (nvidia-settings)
    nvidiaSettings = true;

    # Using the proprietary NVIDIA driver
    open = false;

    # Select the driver package version
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Enable NVIDIA Prime for hybrid graphics setups (e.g., laptops with both integrated and discrete GPUs)
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # nvidia-offload <nome-do-programa> to use nvidia
      };

      # Run 'nix-shell -p lshw --run "sudo lshw -c display"'.
      amdgpuBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
