pipeline {
  environment {
    registry = 'kogisu12/nginx'
    registryCredential = 'docker'
    dockerImage = ''
  }
  agent {
    label 'docker'
  }
  stages {
    stage('Checkout Source') {
      steps {
        echo 'checking out git repo'
        checkout scm
      }
    }

    stage('Building image') {
      agent {
        docker {
          label 'docker'
        }
      }
      steps {
        script {
          dockerImage = docker.build registry + ":latest"
        }
      }
    }

    stage('Deploy Image') {
      agent {
        docker {
          label 'docker'
        }
      }
      steps {    
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy App') {
      steps {
        echo 'deploying app'
        // script {
        //   kubernetesDeploy(configs: "guestbook/", kubeconfigId: "mykubeconfig")
        // }
      }
    }

  }

}