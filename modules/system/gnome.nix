{ config, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;

  # Enable the Ozone/Wayland backend for better performance and compatibility with modern hardware.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
