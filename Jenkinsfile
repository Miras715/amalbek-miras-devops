pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Miras'
        STUDENT_SURNAME = 'Amalbek'
        STUDENT_GROUP   = 'IT2-2313'
        STUDENT_ID      = '37270'
        IMAGE_NAME      = 'amalbek-miras-devops'
        CONTAINER_NAME  = 'amalbek-miras-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'git log -1 --oneline'
            }
        }
        stage('Build') {
            steps {
                sh 'ls -la'
                sh 'bash -n scripts/Amalbek_Miras_system.sh'
                sh 'chmod +x scripts/Amalbek_Miras_system.sh'
                echo 'Project files are OK'
            }
        }
        stage('Test') {
            steps {
                sh 'test -f Amalbek_Miras_info.txt'
                sh 'grep "Student ID: ${STUDENT_ID}" Amalbek_Miras_info.txt'
                sh 'docker run --rm -i python:3.12-slim python -c "import ast,sys; ast.parse(sys.stdin.read()); print(\'main.py syntax OK\')" < app/main.py'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
                sh 'docker images ${IMAGE_NAME}'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker rm -f ${CONTAINER_NAME} || true'
                sh '''
                    docker run -d --name ${CONTAINER_NAME} -p 8090:8080 \
                      -e STUDENT_NAME=${STUDENT_NAME} \
                      -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                      -e STUDENT_GROUP=${STUDENT_GROUP} \
                      -e STUDENT_ID=${STUDENT_ID} \
                      ${IMAGE_NAME}
                '''
                sh 'sleep 3 && docker ps --filter name=${CONTAINER_NAME}'
                sh 'docker logs ${CONTAINER_NAME}'
            }
        }
    }

    post {
        success { echo "Pipeline finished successfully for ${STUDENT_NAME} ${STUDENT_SURNAME}" }
        failure { echo "Pipeline failed for ${STUDENT_NAME} ${STUDENT_SURNAME}" }
    }
}
