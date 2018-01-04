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
        sh 'aws lambda create-function --function-name blueocean-lambda --zip-file fileb://./function.zip --timeout 30 --role arn:aws:iam::459375513878:role/lambda_bot_execution --handler index.handler  --runtime nodejs6.10 --region us-west-2 || aws lambda update-function-code --function-name blueocean-lambda --zip-file fileb:/./function.zip'
      }
    }
  }
}