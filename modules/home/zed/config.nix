{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    # mutableUserSettings = false; # only nix can modify
    # mutableUserKeymaps = false; # only nix can modify
    package = lib.mkDefault pkgs.emptyDirectory;

    extensions = [
      "html"
      "toml"
      "sql"
      "make"
      "nix"
    ];

    userSettings = {
      languages = {
        JSON = {
          format_on_save = "off";
        };
        JSONC = {
          format_on_save = "off";
        };
      };

      terminal = {
        shell = {
          program = "zsh";
        };
      };

      file_types = {
        "Shell Script" = [
          "envrc"
          ".envrc"
          "*.envrc"
        ];
      };

      ui_font_size = 16;
      buffer_font_size = 15;

      theme = "One Dark";
    };

    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          "ctrl-shift-enter" = "workspace::NewTerminal";
          "ctrl-k f" = "workspace::CloseProject";
        };
      }
    ];
  };
}
