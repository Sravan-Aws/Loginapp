node 
{
    stage('Git-Clone'){
       git 'https://github.com/Sravan-Aws/Loginapp.git' 
    }
    stage('Package'){
    
def MVN_HOME = tool name: 'mvn', type: 'maven'

sh('${MVN_HOME}/bin/mvn package')

}
stage('Deploy'){
sshagent(['ec2-user']) {
      sh 'scp -o StrictHostKeyChecking=no target/*.war ec2-user@52.91.29.139:8090:/home/ec2-user/apache-tomcat-9.0.27/webapps/'
}
}
}