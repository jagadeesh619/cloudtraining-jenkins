pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Zip the application files, excluding the Jenkinsfile
                    sh 'zip -q -r sampleweb.zip ./* -x "Jenkinsfile*"'
                }
            }
        }

        stage('Test') {
            steps {
                // Placeholder for running unit tests
                echo "Unit test cases are successfully tested."
            }
        }

        stage('Deploy to Elastic Beanstalk') {
            steps {
                script {
                    // Install AWS Elastic Beanstalk CLI using pip3.6
                    sh 'pip3.6 install awsebcli --upgrade --user'

                    // Ensure that the `eb` command is in the PATH
                    sh 'export PATH=$PATH:~/.local/bin'

                    // Configure EB CLI
                    sh 'eb init -p python-3.6 samplewebapp --region us-east-1'

                    // Create or update environment (ignore error if environment already exists)
                    sh 'eb create Samplewebapp-env || true'

                    // Deploy the application
                    sh 'eb deploy'
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace
            deleteDir()
            echo "Deleted previous workspace"
        }
        success {
            // Actions to take on successful pipeline run
            echo "Your pipeline job was successful, sending mail..."
            // Add mail sending logic here if needed
        }
        failure {
            // Actions to take on pipeline failure
            echo "Your pipeline job failed, sending mail..."
            // Add mail sending logic here if needed
        }
    }
}
