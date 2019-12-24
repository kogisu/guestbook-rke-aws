node {
  stage('Initialize') {
    def dockerHome = tool 'docker'
    env.PATH = "${dockerHome}/bin:${env.PATH}"
  }
  stage('Checking env') {
    echo 'Checking env'
    sh 'docker -v'
  }
}