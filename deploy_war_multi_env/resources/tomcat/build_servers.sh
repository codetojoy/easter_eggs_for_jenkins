
PROJECT_HOME=/Users/measter/src/github/codetojoy/jenkins2_sandbox/resources/tomcat
SERVER_HOME=/Users/measter/vault_offline/docker_root/jenkins/userContent/servers

# Docker Tomcat DEV on port 5555

cd $PROJECT_HOME/dev
IMAGE_NAME=tomcat_image_dev
docker build -t $IMAGE_NAME .

mkdir -p $SERVER_HOME/tomcat_DEV
cd $SERVER_HOME/tomcat_DEV
CONTAINER_NAME=tomcat_DEV
PORT=5555
docker run --name $CONTAINER_NAME -d -p $PORT:8080 -v $PWD:/data -t $IMAGE_NAME

# Docker Tomcat QA on port 5566

cd $PROJECT_HOME/qa
IMAGE_NAME=tomcat_image_qa
docker build -t $IMAGE_NAME .

mkdir -p $SERVER_HOME/tomcat_QA
cd $SERVER_HOME/tomcat_QA
CONTAINER_NAME=tomcat_QA
PORT=5566
docker run --name $CONTAINER_NAME -d -p $PORT:8080 -v $PWD:/data -t $IMAGE_NAME

# Docker Tomcat UAT on port 5577 

cd $PROJECT_HOME/uat
IMAGE_NAME=tomcat_image_uat
docker build -t $IMAGE_NAME .

mkdir -p $SERVER_HOME/tomcat_UAT
cd $SERVER_HOME/tomcat_UAT
CONTAINER_NAME=tomcat_UAT
PORT=5577
docker run --name $CONTAINER_NAME -d -p $PORT:8080 -v $PWD:/data -t $IMAGE_NAME

