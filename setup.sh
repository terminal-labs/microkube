docker run -d -p 5000:5000 --restart=always --name registry registry:2
docker pull hello-world
docker tag hello-world localhost:5000/hello-world
docker push localhost:5000/hello-world

pip install -r tools/requirements.txt
