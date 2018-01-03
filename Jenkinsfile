pipeline {
  agent {
    docker {
      image 'node:6.10'
    }
     environment {
        npm_config_cache = 'npm-cache'       
    }
  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
    stage('test') {
      steps {
        sh 'npm test'
      }
    }
  }
}
