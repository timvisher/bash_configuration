function n64 {
  local game=$(find ~/Dropbox/ROMs -type f -iname "*$1*")
  mupen64plus --fullscreen --gfx mupen64plus-video-glide64mk2 "$game"
}
