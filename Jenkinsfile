pipeline {
  agent none
  stages {
    stage ("lint dockerfile") {
      agent {
        label 'docker'
        docker {
          image 'hadolint/hadolint:latest-debian'
        }
      }
      steps {
        sh 'hadolint nginx/ | tee -a hadolint_lint.txt'
      }
      post { 
        always {
          archiveArtifacts 'hadolint_lint.txt'
        }
      }
    }
  }
}