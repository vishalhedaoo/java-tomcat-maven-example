pipeline {
    agent none

    environment {
        APP_NAME = "myapp"
        DEPLOY_PATH = "/opt/tomcat/webapps"
    }

    stages {

        stage('Master Deployment') {
            when {
                branch 'master'
            }
            agent { label 'master-node' }

            steps {
                checkout scm
                sh 'mvn clean package'

                sshagent(['tomcat-ssh-key']) {
                    sh '''
                    scp target/*.war ubuntu@18.215.233.84:${DEPLOY_PATH}/${APP_NAME}.war
                    ssh ubuntu@18.215.233.84 "sudo systemctl restart tomcat"
                    '''
                }
            }
        }

        stage('Q1 Deployment') {
            when {
                branch '2026Q1'
            }
            agent { label '2026Q1node' }

            steps {
                checkout scm
                sh 'mvn clean package'

                sshagent(['tomcat-ssh-key']) {
                    sh '''
                    scp target/*.war ubuntu@Q1_3.84.228.60:${DEPLOY_PATH}/${APP_NAME}.war
                    ssh ubuntu@Q1_3.84.228.60 "sudo systemctl restart tomcat"
                    '''
                }
            }
        }

        stage('Q2 Deployment') {
            when {
                branch '2026Q2'
            }
            agent { label '2026Q2node' }

            steps {
                checkout scm
                sh 'mvn clean package'

                sshagent(['tomcat-ssh-key']) {
                    sh '''
                    scp target/*.war ubuntu@Q2_35.173.180.69:${DEPLOY_PATH}/${APP_NAME}.war
                    ssh ubuntu@Q2_35.173.180.69 "sudo systemctl restart tomcat"
                    '''
                }
            }
        }
    }
}
