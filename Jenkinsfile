node {
  def registry = 'kogisu12/nginx'
  stage('Initialize') {
    def dockerHome = tool 'docker'
    env.PATH = "${dockerHome}/bin:${env.PATH}"
  }
  stage('Checking env') {
    echo 'Checking env'
    sh 'docker -v'
  }

  stage('Build image') {
    dockerImage = docker.build(registry + ":latest", "-f ./nginx/Dockerfile .")
  }

  stage('Push Image') {
    docker.withRegistry( "", 'docker' ) {
      dockerImage.push()
    }
  }
  // stage('Build image') {
  //   echo 'Building Docker image...'
  //   withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
  //     sh "docker login -u ${env.dockerUser} -p ${env.dockerPassword}"
  //     sh "docker build -t ${registry}:latest ."
  //     sh "docker push ${registry}"
  //   }
  // }
}