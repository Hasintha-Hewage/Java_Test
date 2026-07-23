pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Compile Java') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'javac test.java'
                    } else {
                        bat 'javac test.java'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t java-hello-world:${BUILD_NUMBER} .'
                    } else {
                        bat 'docker build -t java-hello-world:%BUILD_NUMBER% .'
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker run --rm java-hello-world:${BUILD_NUMBER}'
                    } else {
                        bat 'docker run --rm java-hello-world:%BUILD_NUMBER%'
                    }
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'rm -f test.class'
                    } else {
                        bat 'del /q test.class'
                    }
                }
            }
        }
    }
}