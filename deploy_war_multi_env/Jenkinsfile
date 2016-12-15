#!groovy

stage "initial checkout"

node {
    git url: "https://github.com/codetojoy/jenkins2_sandbox.git"
}

stage "build"
node {
    def gradleHome = tool "G31"
    sh "${gradleHome}/bin/gradle clean test war -PBUILD_NUMBER=${env.BUILD_NUMBER}"
}

// -------------------------- DEV (auto-deploy)
stage "auto-deploy for DEV"
node {
    env.WORKSPACE = pwd() // See https://issues.jenkins-ci.org/browse/JENKINS-33511
    def ENV = "DEV"
    def SRC_DIR = "${env.WORKSPACE}/build/libs" 
    def DEST_DIR = "${env.WORKSPACE}/../../userContent/share"

    sh "${env.WORKSPACE}/resources/stage.sh $ENV ${env.BUILD_NUMBER} $SRC_DIR $DEST_DIR"
    sh "${env.WORKSPACE}/resources/deploy.sh $ENV ${env.BUILD_NUMBER}"
}

// -------------------------- QA
stage "deploy to QA"
timeout(time:2, unit:'DAYS') {
    input message:'Approve deployment to QA?'
}

node {
    env.WORKSPACE = pwd()
    def ENV = "QA"
    def SRC_DIR = "${env.WORKSPACE}/build/libs" 
    def DEST_DIR = "${env.WORKSPACE}/../../userContent/share"

    sh "${env.WORKSPACE}/resources/stage.sh $ENV ${env.BUILD_NUMBER} $SRC_DIR $DEST_DIR"
    sh "${env.WORKSPACE}/resources/deploy.sh $ENV ${env.BUILD_NUMBER}"
}

// -------------------------- UAT 
stage "deploy to UAT"
timeout(time:2, unit:'DAYS') {
    input message:'Approve deployment to UAT?'
}

node {
    env.WORKSPACE = pwd()
    def ENV = "UAT"
    def SRC_DIR = "${env.WORKSPACE}/build/libs" 
    def DEST_DIR = "${env.WORKSPACE}/../../userContent/share"

    sh "${env.WORKSPACE}/resources/stage.sh $ENV ${env.BUILD_NUMBER} $SRC_DIR $DEST_DIR"
    sh "${env.WORKSPACE}/resources/deploy.sh $ENV ${env.BUILD_NUMBER}"
}
