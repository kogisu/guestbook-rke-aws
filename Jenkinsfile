pipeline {
  environment {
    image = 'kogisu12/nginx'
  }
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
          dockerImage = docker.build "$image":latest
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