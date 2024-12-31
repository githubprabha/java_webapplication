pipeline {
    agent {label 'slave'}
    tools {
    maven 'maven'
  }
     environment {
        SCANNER_HOME = tool 'sonarqube-server'
    }
    stages {
        stage('git checkout') {
            steps {
            git 'https://github.com/githubprabha/java_webapplication.git'
            }
        }
        stage('compile') {
            steps {
              sh 'mvn clean compile'
            }
        }
        stage('code analysis') {
            steps {
              withSonarQubeEnv('sonarqube-scanner') {
               sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=java_webapplication \
               -Dsonar.java.binaries=. \
               -Dsonar.projectKey=java_webapplication'''
              }
            }
        }
        stage('docker-stage-clear') {
          steps {
              sh 'docker stop $(docker ps -q) || true'
              sh 'docker rm $(docker ps -aq) || true'
              sh 'docker rmi $(docker images -q) || true'
           }
        }
        stage('docker-image') {
          steps {
            sh 'docker build -t dockerprabha2001/java-web .'
          }
        }
        stage('docker push') {
          steps {
            script {
              withDockerRegistry(credentialsId: 'docker-cred', url: 'https://hub.docker.com/') {
              sh 'docker push dockerprabha2001/java-web'
                  }
              }
            }
         }
        stage('docker-container') {
          steps {
            sh 'docker run -itd -p 8081:8080 dockerprabha2001/java-web' 
          }
        }
    }
    post {
        always {
            echo 'slack Notification.'
            slackSend channel: '#java-ci-cd-pipeline', message: 'Build success'
        }
    }
}
