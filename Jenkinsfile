pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flaskdockerapp2 .'
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh 'docker tag flaskdockerapp2 shal905/flaskdockerapp2'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'DOCKER_PASS')]) {
                    sh """
                        echo $DOCKER_PASS | docker login -u shal905 --password-stdin
                        docker push shal905/flaskdockerapp2
                    """
                }
            }
        }
    }

    post {
        success {
            mail to: 'shalini.s123456@gmail.com',
                 subject: 'Jenkins Build Success',
                 body: "The Jenkins pipeline for flaskdockerapp2 completed successfully!"
        }
        failure {
            mail to: 'shalini.s123456@gmail.com',
                 subject: 'Jenkins Build Failed',
                 body: "The Jenkins pipeline for flaskdockerapp2 has failed."
        }
    }
}



