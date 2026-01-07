pipeline {
    agent any

    triggers {
        githubPush()
    }
    stages {
        stage ('Clean workspace'){
            steps {
                sh 'sudo chown -R jenkins:jenkins /var/lib/jenkins/workspace || true'
                cleanWs()
            }
        }
    }
}