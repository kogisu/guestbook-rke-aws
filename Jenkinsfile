node {
  def registry = 'kogisu12/nginx'
  def dockerImage = ""
  stage('Initialize') {
    def dockerHome = tool 'docker'
    env.PATH = "${dockerHome}/bin:${env.PATH}:/usr/bin"
  }
  stage('Check out git repo') {
      echo 'Checking out'
      checkout scm
    }
  stage('Checking env') {
    echo 'Checking env'
    sh 'docker -v'
  }
  stage('Lint HTML') {
    sh 'tidy -q -e *.html'
  }
  stage('Build image / Push to registry') {
    echo 'Building Docker image and pushing to registry...'
    withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
      sh "docker login -u ${env.dockerUser} -p ${env.dockerPassword}"
      sh "docker build -t ${registry}:latest ."
      sh "docker push ${registry}"
    }
  }

  stage('Deploy App') {
    echo 'deploying to cluster'
    kubernetesDeploy(configs: "webapp.yaml", kubeconfigId: "mykubeconfig")
  }
}