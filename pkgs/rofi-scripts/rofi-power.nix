{ symlinkJoin, gawk, bash, writeShellScriptBin, rofi, betterlockscreen, theme ?
  "listview { layout:horizontal;} window {width:20%; children:[horibox];} horibox {children:[listview];}"
}:

let
  awk = "${gawk}/bin/awk";
  rofi-power = writeShellScriptBin "rofi-power" ''
    #!${bash}/bin/bash
    enumerate () {
      ${awk} -F"|"  '{ for (i = 1; i <= NF; ++i) print "<big>"$i"</big><sub><small>"i"</small></sub>"; exit } '
    }
    question=$(printf "||||"| enumerate|rofi -dmenu -markup-rows -theme-str "${theme}")

    case $question in
      **)
          ${betterlockscreen}/bin/betterlockscreen --lock
          ;;
      **)
          systemctl suspend
          ;;
      **)
          loginctl terminate-session $XDG_SESSION_ID
          ;;
      **)
          systemctl reboot
          ;;
      **)
          systemctl poweroff
          ;;
      *)
          exit 0  # do nothing on wrong response
          ;;
    esac
  '';

in symlinkJoin {
  name = "rofi-scripts";
  paths = [ rofi-power ];
}
