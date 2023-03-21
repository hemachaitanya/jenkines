pipeline{
    agent{lable 'RRR'}
    stages{
        stage('vcs'){
            steps{
                git url :'https://github.com/hemachaitanya/openmrs-core.git',
                    branch:'master'
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('copy path'){
            steps{
                sh 'sudo cp openmrs-core/webapp/target/*.war  /opt/tomcat/latest/webapps/',
                sh 'sudo systemctl stop tomcat',
                sh 'sudo systemctl start tomcat'
            }
        }
    }
}
    
