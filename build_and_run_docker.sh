
docker stop ofh-bucket || true

docker rm ofh-bucket || true

docker volume rm ofh-bucket-data

docker run -itd --restart unless-stopped \
   -p 6003:9000 \
   -p 6004:9001 \
   -p 6005:6005 \
   --name ofh-bucket \
   -v ofh-bucket-data:/data \
   -e "MINIO_ROOT_USER=ofh" \
   -e "MINIO_ROOT_PASSWORD=ofh-bucket" \
   quay.io/minio/minio server /data --console-address ":6005"
