function docker-cleanup -d "Clean up dangling Docker images and volumes"
  set dangling_images (docker images -q -f "dangling=true")
  set dangling_volumes (docker volume ls -q -f "dangling=true")

  if test -n "$dangling_images"
    docker rmi $dangling_images
  end

  if test -n "$dangling_volumes"
    docker volume rm $dangling_volumes
  end
end
