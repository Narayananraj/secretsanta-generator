pipeline {
    agent any
    
    tools {
        jdk 'jdk17'          // Ensure JDK 17 is installed and configured in Jenkins
        maven 'maven3'        // Ensure Maven 3 is installed and configured in Jenkins
    }
    
    environment {
        SCANNER_HOME = tool 'sonar-scanner' // Ensure sonar-scanner is configured in Jenkins
    }

    stages {
        stage('Git Checkout') {
            steps {
                // Pull code from the GitHub repository
                git 'https://github.com/Narayananraj/secretsanta-generator.git'
            }
        }

        stage('Code Compile') {
            steps {
                // Compile the code using Maven
                sh "mvn clean compile"
            }
        }

        stage('Unit Tests') {
            steps {
                // Run unit tests using Maven
                sh "mvn test"
            }
        }

        stage('OWASP Dependency Check') {
            steps {
                // Run OWASP Dependency Check for vulnerabilities
                dependencyCheck additionalArguments: '--scan ./', odcInstallation: 'DC'
                // Publish the dependency check report
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Run SonarQube analysis using the SonarScanner
                withSonarQubeEnv('sonar') {
                    sh ''' 
                    $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Santa \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=Santa
                    '''
                }
            }
        }

        stage('Code Build') {
            steps {
                // Package the code using Maven (build the JAR or WAR)
                sh "mvn clean package"
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image
                    withDockerRegistry(credentialsId: 'docker-cred') {
                        sh "docker build -t santa123 ."
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Tag and push Docker image to Docker Hub
                    withDockerRegistry(credentialsId: 'docker-cred') {
                        sh "docker tag santa123 narayananraj/santa123:latest"
                        sh "docker push narayananraj/santa123:latest"
                    }
                }
            }
        }
         stage('Docker Run') {
            steps {
                script {
                    // Run the Docker container to host the app
                    sh "docker run -d -p 8081:8080 narayananraj/santa123:latest"
                }
            }
        }
    }
}
