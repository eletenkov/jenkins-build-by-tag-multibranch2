pipeline {
    agent any
    environment {
        BRANCH_NAME = "${env.GIT_BRANCH}"
        TAG = "${BUILD_TAG}"
    }
    stages {
        stage('Echo') {
            steps {
                echo 'Show branch ' + BRANCH_NAME
                echo 'Show branch ' + "${env.BRANCH_NAME}"
                echo 'Show tag ...' + TAG
            }
        } 
        stage('Build') {
            steps {
                echo 'make package'
            }
        }
        stage('Test') {
            steps {
                echo 'make test'
            }
        }
        stage('Deploy to staging') {
            when { 
                branch "master"
            }
            steps {
                echo 'Deploying only because this commit is branch...'
            }
        }
        
        stage('Deploy to production') {
            when { 
                tag "release-*"
            }
            steps {
                echo 'Deploying only because this commit is tagged...'
            }
        }
    }
}
