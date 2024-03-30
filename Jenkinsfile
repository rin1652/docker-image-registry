pipeline{
  agent any
  stages{
    /// 
    // stage('Setup project environment') {
    //         steps {
    //             script {
    //                 try {
    //                     withCredentials([file(credentialsId: 'docker-hub', variable: 'ProjectEnvFile')]){
    //                         sh "rm -rf $WORKSPACE/.env"
    //                         sh 'cp $ProjectEnvFile $WORKSPACE/.env'
    //                     }
    //                 } catch (err) {
    //                     throw new Exception("Throw to stop pipeline")
    //                 }
    //             }
    //         }
    //     }
    stage('Clone'){
      steps{
        git 'https://github.com/rin1652/docker-image-registry.git'
      }
    }
    stage('Build'){
      steps{
        withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
          sh 'docker build -t rin1652/docker-image-registry:v10 .'
          sh 'docker push rin1652/docker-image-registry:v10'
        }
      }
    }
  }
}

