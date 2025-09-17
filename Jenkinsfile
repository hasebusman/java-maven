pipeline{
    agent any
   parameters{
        string(name: 'param1', defaultValue: 'default1', description: 'this is a string parameter')
        booleanParam(name: 'param2', defaultValue: true, description: 'this is a boolean parameter')
        choice(name: 'param3', choices: ['option1', 'option2', 'option3'], description: 'this is a choice parameter')
    }
    environment{
        VAR1 = "value1"
        VAR2 = "value2"
        SERVER_CREDENTIALS = credentials('server-creds')
    }
    stages{
        stage('testing'){
            steps{
            echo "testing pipeline"
            }
        }
    }
    post{
        always{
            echo "this will always execute"
            echo " server creds are ${SERVER_CREDENTIALS}"
        }
        success{
            echo "this will execute only if the pipeline is successful"
            withCredentials([usernamePassword(credentialsId: 'server-creds', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                sh 'echo $USERNAME'
                sh 'echo $PASSWORD'
            }
        }
        failure{
            echo "this will execute only if the pipeline fails"
            currentBuild.result = 'FAILURE'
            error("Pipeline failed") 
            
        }
    }
}
