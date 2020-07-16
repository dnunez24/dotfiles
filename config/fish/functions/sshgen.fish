function sshgen -d "Generate an SSH key pair with sensible defaults" -a outfile owner
  # getopts $argv | while read -l key value
  #   switch $key
  #     case _
  #       set outfile $value[1]
  #       set owner $value[2]
  #     case h
  #       usage
  #     case '*'
  #       usage
  #   end
  # end

  # if test -z "$owner"
  #   echo "Owner required"
  #   exit 1
  # end
  #
  # if test -z "$outfile"
  #   echo "Output filename required"
  #   exit 1
  # end

  # TODO: read config from a .sshgen dotfile

  # See: https://blog.g3rt.nl/upgrade-your-ssh-keys.html
  # ssh-keygen -q -o -a 100 -t ed25519 -C "$owner" -f "$outfile"
#   ssh-keygen \
#     -q \ # be quiet
#     -o \ # use new format private key
#     -a 100 \ # more KDF rounds to protect against password brute force
#     -t ed25519 \ # use more modern encryption
#     -C "david.nunez@alumni.stanford.edu" \ # specify the key owner
#     -f $outfile # output to specific filename

  echo "$outfile $owner"

  function usage
    echo "\
    Usage: sshgen [OPTIONS] OUTFILE [OWNER]

    OPTIONS:

        -h        Show this help
    "
  end
end
