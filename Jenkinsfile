node {
  stage('Checking env') {
    steps {
      docker.withTool('docker') {
        def customImage = docker.build("kogisu12/nginx:latest")
        customImage.push()
      }
    }
  }
}