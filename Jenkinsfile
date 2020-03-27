pipeline {
    agent any
    stages {
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
        stage('Deploy') {
            when { tag "release-*" }
            steps {
                echo 'Deploying only because this commit is tagged...'
            }
        }
    }
}
