{ config, pkgs, ... }:

{
  # Graphics configuration for Intel
  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Enable thermald (Intel CPUs)
  services.thermald.enable = true;

  # Intel GPU drivers
  services.xserver.videoDrivers = [ "modesetting" ];
}
