pipeline {
    agent { label 'jenkins-agent' }
    
    stages{
        stage('Checkout'){
            steps{
                git url: 'https://github.com/freudops/nodejs-example.git', branch: 'master'
            }
        }
        stage('Build'){
            steps{
                sh 'sudo docker build . -t freudops/nodo-todo-app-test:latest'
            }
        }
        stage('Test image') {
            steps {
                echo 'testing...'
                sh 'sudo docker inspect --type=image freudops/nodo-todo-app-test:latest '
            }
        }
        
        stage('Push'){
            steps{
        	     sh "sudo docker login -u freudops -p dckr_pat_9HokRfK9yqUcgabscd6VYciL6Q8"
                 sh 'sudo docker push freudops/nodo-todo-app-test:latest'
            }
        }  
        stage('Deploy'){
            /*steps{
                echo 'deploying on another server'
                sh 'sudo docker stop nodetodoapp || true'
                sh 'sudo docker rm nodetodoapp || true'
                sh 'sudo docker run -d --name nodetodoapp freudops/nodo-todo-app-test:latest'
                sh '''
                ssh root@49.13.114.184 <<EOF
                sudo docker login -u freudops -p dckr_pat_9HokRfK9yqUcgabscd6VYciL6Q8
                sudo docker pull freudops/nodo-todo-app-test:latest
                sudo docker stop nodetodoapp || true
                sudo docker rm nodetodoapp || true 
                sudo docker run -p 8000:8000 -d --name nodetodoapp freudops/nodo-todo-app-test:latest
                '''
            }*/
            steps{
                echo 'deploying on another server'
                sh 'sudo docker stop nodetodoapp || true'
                sh 'sudo docker rm nodetodoapp || true'
                sh 'sudo docker run -d --name nodetodoapp freudops/nodo-todo-app-test:latest'
                sh '''
                ssh root@49.13.114.184 <<EOF
                sudo docker login -u freudops -p dckr_pat_9HokRfK9yqUcgabscd6VYciL6Q8
                sudo docker pull freudops/nodo-todo-app-test:latest
                sudo docker stop nodetodoapp || true
                sudo docker rm nodetodoapp || true
                sudo docker compose up web
                '''
            }
        }
    }
}
