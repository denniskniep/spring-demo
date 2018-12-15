pipeline {
  agent any
  stages {
    def app

    stage('Clone repository') {
      checkout scm
    }

    stage('Build') {
      steps {
        sh 'echo "Hello"'
      }
    }
  }
}