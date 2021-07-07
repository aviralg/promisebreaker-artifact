docker build -t rsh-artifact .
docker run -it rsh-artifact
docker save rsh-artifact --output rsh-artifact.tgz
