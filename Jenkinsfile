pipeline {
  agent any

  environment {
        DOCKER_REGISTRY_USERNAME = credentials('DOCKER_REGISTRY_USERNAME')
        DOCKER_REGISTRY_PASSWORD = credentials('DOCKER_REGISTRY_PASSWORD')
  }

  stages {
    stage ('Install dependencies') {
      steps {
        nodejs(nodeJSInstallationName: 'nodejs 8.9.4') {
          sh '''
            echo "Installing..."
            npm install
            echo "Install dependencies successfully."
            ls -al
          '''
        }
      }
    }

    stage ('Build') {
      steps {
        nodejs(nodeJSInstallationName: 'nodejs 8.9.4') {
          sh 'echo "Build application..."'
          sh 'npm run build'
          sh 'echo "Build application successfully."'
          sh 'ls -al'
        }
        script {
          stash includes: 'build/', name: 'build'
          stash includes: 'docker/', name: 'docker_folder'
        }
      }
    }

    stage ('Test') {
      steps {
        nodejs(nodeJSInstallationName: 'nodejs 8.9.4') {
          sh '''
            echo "Run unit test..."
            npm test
            echo "Run unit test successfully."
          '''
        }
      }
    }

    stage ('Create docker images') {
      steps {
        script {
          unstash 'build'
          unstash 'docker_folder'
        }

        sh '''
          ls -al
          echo "Starting to build docker image"
          docker build -t phanhieu0825/pick-color:v1.${BUILD_NUMBER} -f docker/Dockerfile .
        '''

        sh '''
            echo "Starting to push docker image"
            echo ${DOCKER_REGISTRY_PASSWORD} | docker login -u ${DOCKER_REGISTRY_USERNAME} --password-stdin
            docker push "phanhieu0825/pick-color:v1.${BUILD_NUMBER}"
        '''
      }
    }
  }
}