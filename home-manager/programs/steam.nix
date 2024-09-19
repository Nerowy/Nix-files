{config, ...}:{
  # link vrchat pictures to pictures folder
systemd.user.tmpfiles.rules = [
  "L ${config.home.homeDirectory}/Pictures/VRChat - - - - ${config.home.homeDirectory}/.steam/root/steamapps/compatdata/438100/pfx/drive_c/users/steamuser/Pictures/VRChat"
];
}