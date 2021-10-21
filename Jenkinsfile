pipeline {
    agent any
    stages {
        stage('Build/Test DotNet') {
            agent {docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }}
            environment {DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'}
            steps {
                checkout scm
                echo 'Building..'
                sh "dotnet build"
                echo 'Testing....'
                sh "dotnet test"
            }
        }
        stage('Build Node') {
            agent {docker {image 'node:16-alpine'}}
            environment {DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'}
            steps {
                echo 'Building Node....'
                echo "Changing working directory"
                dir("./DotnetTemplate.Web") {
                    sh "npm install"
                    sh "npm run build"
                    sh "npm t"
                    sh "npm run lint"
                }
            }
        }
    }
}
