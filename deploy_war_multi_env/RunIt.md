
### Docker Jenkins setup

* instructions [here](https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+with+Docker)
* `docker pull jenkins`
* confirm with `docker images`
* in Docker terminal: `echo $DOCKER_HOST` (e.g. tcp://192.168.99.100:2376)
* to run on port 5155 using `$PWD` as jenkins folder: 
    * `docker run -d -p 5155:8080 -v $PWD:/var/jenkins_home -t jenkins`
* browse to http//DOCKER_HOST:5155
* to get to bash: `docker exec -it <containerIdOrName> bash`
* find password: `cat /var/jenkins_home/secrets/initialAdminPassword`

docker stop [containerId]

### Docker Tomcat setup prerequisites

* `docker pull tomcat`
* confirm with `docker images`
* in Docker terminal: `echo $DOCKER_HOST` (e.g. tcp://192.168.99.100:2376)

### Docker Tomcat setup for DEV, QA, UAT

* edit `~/resources/tomcat/build_servers.sh`

### Architecture

* Jenkins copies (or *stages*) the WAR file to `~/jenkins/userContent/servers`
    * e.g. for DEV it is copied to `~/jenkins/userContent/servers/tomcat_DEV`
* each Tomcat container maps `/data` to be the appropriate staging directory
    * e.g. `/data` on Tomcat QA is `~/jenkins/userContent/servers/tomcat_QA`
* a *deploy* is simply a command-line script to use `/data/greeting.war`
