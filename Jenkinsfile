pipeline {
  agent {
    docker {
      image 'node:6.10'
    }     
  }
  stages {
    environment {
        npm_config_cache = 'npm-cache'       
    }
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
