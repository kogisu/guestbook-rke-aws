pipeline {

  def registry = 'kogisu12/nginx'
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        echo 'checking out git repo'
        checkout scm
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build "$registry":latest
        }
      }
    }

    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( "" ) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "guestbook/", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}