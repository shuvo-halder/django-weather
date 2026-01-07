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
        stage ("checkout"){
            steps {
                checkout scm
                sh 'ls -lah'
            }
        }
        stage ('build and deploy'){
            steps {
                // sh 'docker compose stop dj-weather'
                // sh 'docker compose rm -f dj-weather'
                sh 'echo "buildind and pull up this container...................................."'
                sh 'docker compose build --no-cache'
                sh 'docker compose up -d --force-recreate dj-weather' 
            }
        }
    }
    post {
        success {
            echo "pipeline success!"
        }
        failure {
            echo "pipeline error!"
        }
    }
}

    