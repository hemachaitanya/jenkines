#### jenkins errrors 

[jenkins 50 errors](https://www.prodevopsguy.site/jenkins-errors-with-solutions)

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
  

```Jenkinsfile
pipeline {
    agent any
    
    parameters {
        string(name: 'MASTER_BRANCH', defaultValue: 'master', description: 'Name of the master branch')
        string(name: 'RELEASE_BRANCH', defaultValue: 'release', description: 'Name of the release branch')
        string(name: 'FEATURE_BRANCH', defaultValue: 'feature', description: 'Name of the feature branch prefix')
    }
    
    stages {
        stage('Checkout Master') {
            steps {
                script {
                    checkout scm
                    checkout([$class: 'GitSCM', branches: [[name: "*/${params.MASTER_BRANCH}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'your_git_repository_url']]])
                }
            }
        }
        stage('Checkout Release') {
            steps {
                script {
                    checkout scm
                    checkout([$class: 'GitSCM', branches: [[name: "*/${params.RELEASE_BRANCH}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'your_git_repository_url']]])
                }
            }
        }
        stage('Checkout Feature Branches') {
            steps {
                script {
                    // Get list of branches with the feature prefix
                    def featureBranches = sh(script: 'git ls-remote --heads your_git_repository_url | grep refs/heads/${params.FEATURE_BRANCH} | cut -d "/" -f 3', returnStdout: true).trim().split('\n')
                    // Checkout each feature branch
                    featureBranches.each { branch ->
                        checkout scm
                        checkout([$class: 'GitSCM', branches: [[name: "*/$branch"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'your_git_repository_url']]])
                    }
                }
            }
        }
    }
    
    post {
        // Define post-build actions if needed
    }
}


```


```Jenkinsfile
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/hemachaitanya/azuredevops.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean install' // Or any build command specific to your project
            }
        }
        
        stage('Code Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh 'mvn sonar:sonar' // Run SonarQube analysis
                }
            }
        }
        
        stage('Deploy to Nexus') {
            steps {
                nexusArtifactUploader(
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    nexusUrl: 'NEXUS_URL',
                    groupId: 'YOUR_GROUP_ID',
                    version: '1.0-SNAPSHOT',
                    repository: 'YOUR_REPOSITORY_NAME',
                    credentialsId: 'YOUR_NEXUS_CREDENTIALS_ID',
                    artifacts: [
                        [artifactId: 'your-artifact-id', file: 'path/to/your/artifact']
                    ]
                )
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
```
