pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {

        stage('build') {
           steps{
            sh """ 

            pip3.6 install -r requirements.txt

            zip -q -r sampleweb.zip ./* -x "Jenkinsfile*" -x "README*" 

            """
           }
        }

        stage('test'){
            steps{
            echo "unit test cases are successfully tested "
            }
        }

        stage('Deploy to Elastic Beanstalk') {
            steps {
                script {
                    // Install AWS Elastic Beanstalk CLI
                    sh 'pip install awsebcli --upgrade --user'

                    // Configure EB CLI (if not already configured)
                    sh 'eb init -p python-3.8 samplewebapp --region us-east-1'

                    // Create or update environment
                    sh 'eb create Samplewebapp-env || true'

                    // Deploy the application
                    sh 'eb deploy'
                }
            }
        }
    }
    post {

        always {
            deleteDir()
            echo "Deleted previous workspace"
        }
        success{
            echo "Your pipeline job is success , sent mail"
        }
        failure{
            echo "Your pipeline job is failure, sent mail "
        }
    }
}