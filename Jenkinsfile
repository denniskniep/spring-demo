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
        sh 'env'
        script {
          def customImage = docker.build("spring-demo:${BUILD_ID}")

          customImage.inside('-v ${WORKSPACE}:/jenkins/workspace -u root') {
             sh 'cp /app/src/main/resources/git.properties /jenkins/workspace'
          }
        }

       script {
          def props = readProperties  file: 'src/main/resources/git.properties'
          def version = props['git.build.version'];
          currentBuild.displayName = version + "." + ${BUILD_ID}
        }
      }
    }

    stage('Archive') {
      steps {
        sh 'echo "Hello"'
        script {
           customImage.push()
           customImage.push('latest')
        }
      }
    }
  }
}
