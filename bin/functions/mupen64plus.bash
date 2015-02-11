function n64 {
  local game=$(find ~/Dropbox/ROMs -type f -iname "*$1*")
  mupen64plus --fullscreen --gfx mupen64plus-video-glide64mk2 "$game"
}

function swap-control-scheme {
  cp ~/.config/mupen64plus/$1 ~/.config/mupen64plus/mupen64plus.cfg
}

function mupen64plus-xboxdrv {
  sudo xboxdrv \
       --trigger-as-button \
       --dpad-as-button \
       --ui-buttonmap guide=KEY_ESC \
       --axismap x2^deadzone:27000,y2^deadzone:27000 
}
