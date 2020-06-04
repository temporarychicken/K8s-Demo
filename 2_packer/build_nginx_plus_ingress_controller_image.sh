


echo "The running docker processes are....."

sudo docker ps

# Now we will build an NGINX PLUS INGRESS CONTROLLER docker image

cp ~/certs/nginx-repo.* .


sudo dnf install git -y


git clone https://github.com/nginxinc/kubernetes-ingress/

cd kubernetes-ingress

cp ~/certs/nginx-repo.* .


#git checkout vlatest

sudo make DOCKERFILE=DockerfileForPlus PREFIX=dockerregistry.nginxdemo.net:443/nginx-plus-ingress




