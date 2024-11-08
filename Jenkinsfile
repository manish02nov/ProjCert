pipeline {
    agent { label 'jenkins-slave' }

    stages {
        stage('Monitor Git Repository for Changes') {
            steps {
                // This step will pull changes from the Git repository
                git url: 'https://github.com/manish02nov/ProjCert.git', branch: 'master'
            }
        }

        stage('Job 1: Install Puppet Agent (Optional)') {
            steps {
                script {
                    try {
                        build job: 'Install Puppet Agent', wait: true
                    } catch (Exception e) {
                        echo 'Puppet Job failed or skipped.'
                    }
                }
            }
        }

        stage('Job 2: Install Docker via Ansible') {
            steps {
                // Trigger the Ansible Docker installation job
                build job: 'Install Docker via Ansible', wait: true
            }
        }

        stage('Job 3: Build and Deploy PHP App') {
            steps {
                // Trigger the PHP app build and deploy job
                build job: 'Build and Deploy PHP App', wait: true
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed. Review job stages for errors.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
    }
}
