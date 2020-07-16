function audio-backup --description "Back up audio production files to AWS S3"
  set -l musicDir "$HOME/Music"
  set -l s3Bucket "s3://audio-backups"
  set -l excludes

  for item in "*.DS_Store" "$musicDir/iTunes/*" "$musicDir/GarageBand/*" "$musicDir/iPod/*" "$musicDir/Spitfire Audio/Settings/.ImageCache/*"
    set excludes $excludes "--exclude" "$item"
  end

  aws s3 sync --profile audio-backups $excludes "$musicDir/" "$s3Bucket/"
end
