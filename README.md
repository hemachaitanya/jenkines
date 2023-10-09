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




#### back ups
 
 * create one ec2 instance

 * build one pipeline

 * create one role attach to ec2 and s3full access

 * install awscli
 
* create-bucket (s3)

* sudo tar czvf jenkinsbackup.tar.gz /var/lib/jenkins/

# create another machine

* attach role

* install jenkins

* jenkins service stop

*  install awscli

* sudo rm -rf /var/lib/jenkins/

* sudo tar zxvf jenkinsbackup.tar.gz -C /

* sudo systemctl start jenkins.service

* check to ip already builds will be successed and jobs also existed in /var/lib/jenkins