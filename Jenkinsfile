pipeline {
  agent {
    dockerfile true    
  }
  stages {
    stage('Build') {
      environment {
        npm_config_cache = 'npm-cache'
      }
      steps {
        sh 'npm install'
      }
    }
    stage('test') {
      steps {
        sh 'npm test'
      }
    }
    stage('deploy') {
      steps {
        sh 'zip -r function.zip index.js sms.js node_modules smsRepository.js'
      }
    }
  }
}
