pipeline{
  agent any
  stages{
    stage('Clone'){
      steps{
        git 'https://github.com/rin1652/docker-image-registry.git'
      }
    }
    stage('Build'){
      steps{
        withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
          sh 'docker build -t rin1652/docker-image-registry:v1 .'
          sh 'docker push rin1652/docker-image-registry:v1'
        }
      }
    }
  }
}