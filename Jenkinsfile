pipeline {
     environment {
          registry = "glaucio/devopsmaonamassa-app"
          registryCredential = 'dockerhub'
          dockerImage = ''
     }
     agent { label 'master' }
     stages {
          stage("Compilar") {
               steps {
                    sh 'mvn compile'
               }
          }
          stage("Empacotar") {
               steps {
                    sh 'mvn package -DskipTests'
               }
          }
          stage("Iniciar images"){
               steps {
                    sh "docker-compose up --build -d"
               }
          }
          stage ("Esperar subida containers"){
               steps{
                    sh 'sleep 60'

               }
          }
          stage("Inciar testes"){
               steps{
                    sh "curl http://localhost:8090/api/notes"
               }
          }
          stage("Parar containers"){
               steps{
                    sh "docker-compose down"
               }
          }
          stage("Build imagem App"){
               steps{
                    script{
                         dockerImage =  docker.build registry + ":$BUILD_NUMBER"
                    }
               }
          }
          stage('Deploy our image') {
               steps{
                    script {
                         docker.withRegistry( '', registryCredential ) {
                         dockerImage.push()
                         }
               }
          }
          }
    }
}
