{pkgs, programs, lib, ...} : {

  programs.lf = lib.mkForce {

    enable = true;

    commands = {
      mkdir = ''
      ''${{
        ${pkgs.coreutils}/bin/printf "Directory Name: "
        read ans
        ${pkgs.coreutils}/bin/mkdir $ans
      }}
      '';
      mkfile = '' 
      ''${{
        ${pkgs.coreutils}/bin/printf "File Name: "
        read ans
        $EDITOR $ans
      }}
      '';
      unarchive = ''
      ''${{
        extract "$f"
      }}
      '';
      trash = ''
      ''${{
        files=$(${pkgs.coreutils}/bin/printf "$fx" | tr '\n' ';')
        while [ "$files" ]; do
          file=''${files%%;*}
          ${pkgs.trash-cli}/bin/trash-put "$(basename "$file")"
          if [ "$files" = "$file" ]; then
            files=""
          else
            files="''${files#*;}"
          fi
        done
      }}
      '';
      open = ''
      ''${{
        case $(${pkgs.file}/bin/file --mime-type -Lb $f) in
          text/*) 
            ${pkgs.lf}/bin/lf -remote "send $id \$nvim \$fx";;
          image/*) 
            ${pkgs.swappy}/bin/swappy -f "$fx";;
          application/pdf)
            ${pkgs.zathura}/bin/zathura "$fx";;
        esac
      }}
      '';
      "on-select" = ''
      ''${{
        ${pkgs.lf}/bin/lf -remote "send $id set statfmt \"$(exa -ld --color=always "$f")\""
      }}
      '';
      "z-jump" = ''
      ''${{
        ZLUA_SCRIPT="$ZDOTDIR/plugins/z.lua/z.lua"
        ${pkgs.lf}/bin/lf -remote "send ''${id} cd \"$($ZLUA_SCRIPT -e $@ | sed 's/\\/\\\\/g;s/"/\\"/g')\""
      }}
      '';
    };

    cmdKeybindings = {
      au = "unarchive";
      dd = "trash";
      p = "paste";
      x = "cut";
      y = "copy";
      "<enter>" = "open";
      R = "reload";
      mf = "mkfile";
      md = "mkdir";
      C = "clear";
    };

    keybindings = {
      gc = "cd ~/.config";
      gD = "cd ~/Documents";
      gd = "cd ~/Downloads";
      gp = "cd ~/Pictures";
      gm = "cd ~/Music";
      gs = "cd ~/Scripts";
      gl = "cd ~/Documents/libros";
    };

    extraConfig = 
    let 
      previewer = 
      pkgs.writeShellScriptBin "previewer.sh" ''
        #!/usr/bin/env bash
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5

        fileType="$( ${pkgs.file}/bin/file -Lb --mime-type "$file")"
        filename=$(${pkgs.coreutils}/bin/basename $(echo "$file" | tr ' ' '_'))
        if [[ $fileType == *"image"* ]]; then
          ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
          exit 1

        elif [[ $fileType == *"pdf"* ]]; then
          if [[ ! -f "/tmp/$filename.png" ]]; then
              ${pkgs.poppler_utils}/bin/pdftoppm -f 1 -l 1 "$file" >> "/tmp/$filename.png"
          fi
          ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "/tmp/$filename.png" < /dev/null > /dev/tty
          exit 1 

        fi

        ${pkgs.pistol}/bin/pistol "$file"
      '';

      cleaner = pkgs.writeShellScriptBin "cleaner.sh"''
        #!/usr/bin/env bash

        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in
    ''
      set cleaner ${cleaner}/bin/cleaner.sh
      set previewer ${previewer}/bin/previewer.sh
    '';

    settings = {
      number = true;
      tabstop = 4;
      preview = true;
      icons = true;
      ignorecase = true;
    };

  };

}
