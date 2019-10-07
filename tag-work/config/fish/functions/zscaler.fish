function zscaler --description 'Manage the ZScaler network proxy (requires password)'
  set -l command ""

  for arg in $argv
    switch "$arg"
      case enable
        set command "load"
      case disable
        set command "unload"
      case \*
        printf "error: unknown argument '%s'\n" $arg
        return 1
    end
  end

  if test -z "$command"
    printf "error: argument cannot be empty\n"
    return 1
  end

  sudo launchctl $command /Library/LaunchDaemons/com.zscaler.tunnel.plist
  launchctl $command /Library/LaunchAgents/com.zscaler.tray.plist
end
