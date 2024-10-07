{programs, lib, pkgs, ...} : {
  
  programs.tmux = {
  
    enable = true;
    keyMode = "vi";

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          # Style costumization
          tmux_orange="#fa8585"

          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator " | "

          set -g @catppuccin_window_default_fill "all"
          set -g @catppuccin_window_default_color transparent
          set -g @catppuccin_window_default_background "#cccccc"

          set -g @catppuccin_window_current_fill "all"

          set -g @catppuccin_status_modules_right "null"
          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"

          set -g @catppuccin_window_current_background transparent
          set -g @catppuccin_window_current_color "#89b4fa" # text color
          set -g @catppuccin_status_background transparent

          set -g @catppuccin_pane_active_border_style "fg=#89b4fa"
        '';
      }
    ];

    extraConfig = ''

      set-environment -g PATH "/usr/local/bin:/bin:/usr/bin"

      set -g mouse on

      # Bind gloval key to ñ
      set -g prefix 0xf1
      bind 0xf1 send-prefix

      # Spliting window
      bind-key -T prefix w switch-client -T prefix_window

      # I am more used to vertical meaning split the window vertically
      bind -T prefix_window v split-window -h -c "#{pane_current_path}"
      bind -T prefix_window h split-window -v -c "#{pane_current_path}"

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D 
      bind k select-pane -U
      bind l select-pane -R

      # switch windows
      bind H previous-window
      bind L next-window

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window
      # set vi-mode

      set-window-option -g mode-keys vi
      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'


      run '~/.tmux/plugins/tpm/tpm'
    '';
  };

}
