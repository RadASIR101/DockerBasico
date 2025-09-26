
docker run -it --name alpine 01 alpine sh

docker ps -a

control p + control q

docker stop 

docker ps -a 

docker rm alpine01

docker run -it --rm --name alpine01 alpine sh


echo "# DockerBasico" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/RadASIR101/DockerBasico.git
git push -u origin main