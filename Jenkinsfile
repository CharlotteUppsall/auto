pipeline {
    agent any
    stages {

        stage('Build') {
            steps {
                sh "mvn compile"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }
        stage('newman') {
            steps {
                sh 'newman run Postman_Tutorial.postman_collection.json --environment Postman_Tutorial Enviroment.postman_environment.json --reporters junit'
                }
                post {
                    always {
                        junit '**/*xml'
                        }
                }
        }
    }
}
