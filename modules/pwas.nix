{ config, pkgs, ... }:

{
  xdg.desktopEntries = {
    whatsapp = {
      name = "WhatsApp Web";
      genericName = "Mensageiro";
      exec = "google-chrome-stable --app=https://web.whatsapp.com/";
      icon = "whatsapp";
      terminal = false;
      categories = [ "Network" "InstantMessaging" ];
    };

    youtube-music = {
      name = "YouTube Music";
      genericName = "Player de Música";
      exec = "google-chrome-stable --app=https://music.youtube.com/";
      icon = "youtube";
      terminal = false;
      categories = [ "AudioVideo" "Audio" "Music" ];
    };

    notion = {
      name = "Notion";
      genericName = "Anotações e Organização";
      exec = "google-chrome-stable --app=https://www.notion.so/";
      icon = "notion";
      terminal = false;
      categories = [ "Office" "Utility" ];
    };

    portainer = {
      name = "Portainer";
      genericName = "Gerenciador de Containers";
      exec = "google-chrome-stable --app=http://localhost:9000/";
      icon = "portainer";
      terminal = false;
      categories = [ "Development" "Utility" ];
    };
  };
}