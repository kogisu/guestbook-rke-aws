pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Starting up') {
      echo 'Running pipeline'
    }
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