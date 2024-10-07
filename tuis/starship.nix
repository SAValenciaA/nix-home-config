{programs, lib, ...}: {
  
  programs.starship = {

    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      format = lib.concatStrings [
        "$line_break"
        "$directory"
        "$git_branch"
        "$git_status"
        "$nodejs"
        "$fill"
        "$nix_shell"
        "$line_break"
        "$character"
      ];
      
      nix_shell = {
        format = "[ (nix-$name) ](fg:blue)";
        heuristic = true; # needed to detect `nix shell`
      };

      directory = {
        truncation_length = 3;
        format = "[ $path ](fg:blue bg:surface0)([$read_only ](fg:red bg:surface0))";
        read_only = "";
        truncation_symbol = "../";
        truncate_to_repo = true;
      };

      directory.substitutions = {
        "~/Documents" = " ";
        "~/Downloads" = "󰇚 ";
        "~/Music/long" = "󰽮 ";
        "~/Music/energetic" = "󰽰 ";
        "~/Music/slow" = "󰽯 ";
        "~/Music" = "󰝚 ";
        "~/Pictures" = "  ";
        "~/Scripts" = "  ";
      };

      git_branch = {
        format = "[ $symbol$branch ](fg:mauve)";
        symbol = " ";
      };

      git_status = {
        format = "[$all_status$ahead_behind](fg:mauve)";
      };

      fill = {
        symbol = " ";
      };

      nodejs = {
        symbol = "| ";
        format = "[[ $symbol ($version) ](fg:mauve)]($style)";
      };

      character = {
        success_symbol = "[\\$](blue)";
        error_symbol = "[\\$](red)";
      };
    };
  };

}
