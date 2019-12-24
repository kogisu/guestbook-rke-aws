pipeline {
  agent any
  stages {
    stage('Initialize') {
      def dockerHome = tool 'docker'
      env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stage('Checking env') {
      steps {
        echo 'Checking env'
        sh 'docker -v'
      }
    }
  }
}