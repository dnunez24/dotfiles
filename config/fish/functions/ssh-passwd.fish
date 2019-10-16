function ssh-passwd
  for key in ~/.ssh/id_*
    if ! string match .pub $key
      echo "Update password for $key"
      ssh-keygen -p -f $key
    end
  end
end
