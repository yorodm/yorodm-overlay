{symlinkJoin, bash, writeShellScriptBin, rofi, betterlockscreen}:

let
  rofi-power = writeShellScriptBin "rofi-power" ''
  #!${bash}/bin/bash
  enumerate () {
    ${awk} -F"|"  '{ for (i = 1; i <= NF; ++i) print "<big>"$i"</big><sub><small>"i"</small></sub>"; exit } '
  }
  question=$(printf "||||"| enumerate|rofi -dmenu -markup-rows)

  case $question in
    **)
        light-locker-command -l
        ;;
    **)
        systemctl suspend
        ;;
    **)
        # bspc quit || qtile cmd-obj -o cmd -f shutdown
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

in
symlinkJoin  {
  name = "rofi-scripts";
  paths = [
    rofi-power
  ];
}
