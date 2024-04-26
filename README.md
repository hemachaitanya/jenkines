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

### import job pluggin

* create 2 ec2's and install jenkins

### tools
 we automatic install java by using eclipse plugin
 maven
 git 
### input

* input parameter is used to permit the stage will be exicuted or stoped
## when 

* to skip the stage, with out execution  we used when conditions
  ## general

  * discard old builds:
 
      * you want to givehow many builds u want to run latest
* This project is parameterized:
       u want to give the parameters eaither string , list or choice parameters
  


*  
