function wifi-restart -d "Restart the Wi-Fi connection"
  networksetup -setairportpower en0 off
  networksetup -setairportpower en0 on
end
