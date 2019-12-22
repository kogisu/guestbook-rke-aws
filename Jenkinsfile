pipeline {
  stages {
    stage('Install dependencies') {
      steps {
        sh 'wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
            chmod +x /bin/hadolint'
      }
    }
    stage('Linting') {
      steps {
        sh '/bin/hadolint Dockerfile'
      }
    }
    stage('Deploying') {
      steps {
        sh 'kubectl apply -f guestbook/'
      }
    }
  }
}