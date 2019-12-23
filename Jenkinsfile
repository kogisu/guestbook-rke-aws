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

    stage('Build and Push Image') {
      steps {
        echo 'Building Docker image'
        withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
          sh "docker login -u ${env.dockerUser} -p ${env.dockerPassword}"
          sh "docker build -t ${image} ."
          sh "docker push ${image}"
      }
      }
    }

    stage('Deploy App') {
      step {
        echo 'deploying app'
        // script {
        //   kubernetesDeploy(configs: "guestbook/", kubeconfigId: "mykubeconfig")
        // }
      }
    }

  }

}