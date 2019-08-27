if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

sudo apt-get update
sudo apt-get install docker.io
sudo docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
sudo apt-get install docker-compose
