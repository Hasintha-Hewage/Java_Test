pipeline {
    agent any

    tools {
        jdk "jdk17"
        "hudson.plugins.sonar.SonarRunnerInstallation" "sonar-scanner" 
    }

    environment {
        // Automatically finds where Jenkins installed the scanner
        SCANNER_HOME = tool 'sonar-scanner'
        
        // Your SonarQube authentication token
        SONAR_TOKEN = 'squ_d32865ab41819ba4709dcab56b9bebf27b0882e6'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Hasintha-Hewage/Java_Test.git'
            }
        }

        stage('SonarQube Scan') {
            steps {
                // Runs the code analysis before building the container
                bat '"%SCANNER_HOME%\\bin\\sonar-scanner.bat" -Dsonar.projectKey=Java_Test -Dsonar.sources=. -Dsonar.java.binaries=. -Dsonar.host.url=http://localhost:9000 -Dsonar.token="%SONAR_TOKEN%"'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Builds the Java app using your updated Eclipse Temurin Dockerfile
                bat 'docker build -t my-java-app:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Executes the compiled Java code inside the container and deletes the container afterward
                bat 'docker run --rm my-java-app:latest'
            }
        }
    }
}