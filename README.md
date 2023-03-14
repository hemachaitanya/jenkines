pipeline{
    agent{label'RRR'}
     triggers { 
        pollSCM('* * * * *')
    }
    stages{
        stage('vcs'){
            steps{
                git url: 'https://github.com/hemachaitanya/StudentCoursesRestAPI.git',
                    branch: 'develop'
            
            }
        }
        stage('build'){
            steps{
                sh 'docker build -t hema789/hello:2.0 .'
            }
        }
        stage('scan and push'){
            steps{
                sh 'echo docker scan hema789/hello:2.0'
                sh 'docker push hema789/hello:2.0'
            }
        }
    }
}