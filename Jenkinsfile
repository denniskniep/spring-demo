pipeline {
  agent any
  stages {

    stage('Clone repository') {
      steps {
            checkout scm
      }
    }

    stage('Build') {
      steps {
        sh 'echo "Hello"'
        def customImage = docker.build("spring-demo")

        customImage.inside {
            sh 'echo "Hello from inside of container"'
        }
      }
    }
  }
}