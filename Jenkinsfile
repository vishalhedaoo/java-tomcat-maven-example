pipeline {
    agent none

    environment {
        S3_BUCKET = 'my-war-artifact-bucket'
        WAR_NAME = 'myapp.war'
        TOMCAT_PATH = '/opt/tomcat/webapps'
    }

    stages {

        stage('Checkout Code') {
            agent { label 'master' }

            steps {
                git branch: 'main', url: 'https://github.com/vishalhedaoo/java-tomcat-maven-example.git'
            }
        }

        stage('Build WAR') {
            agent { label 'master' }

            steps {
                sh 'mvn clean package'
                sh 'cp target/*.war ${WAR_NAME}'
            }
        }

        stage('Upload WAR to S3') {
            agent { label 'master' }

            steps {
                sh 'aws s3 cp ${WAR_NAME} s3://${S3_BUCKET}/${WAR_NAME}'
            }
        }

        stage('Download WAR on Slave') {
            agent { label 'slave' }

            steps {
                sh 'aws s3 cp s3://${S3_BUCKET}/${WAR_NAME} ${WAR_NAME}'
            }
        }

        stage('Deploy to Tomcat') {
            agent { label 'slave' }

            steps {
                sh '''
                    sudo rm -rf ${TOMCAT_PATH}/myapp*
                    sudo cp ${WAR_NAME} ${TOMCAT_PATH}/
                    sudo systemctl restart tomcat
                '''
            }
        }
    }
}
