pipeline {
  agent any
  stages {
    stage ("lint dockerfile") {
      agent {
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