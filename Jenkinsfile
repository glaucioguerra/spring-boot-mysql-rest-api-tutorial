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
          stage("Forçar shutdown de instancias"){
               steps {
                    sh "docker-compose down; sleep 10"
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
                    sh "sh testes-integracao.sh"
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
          stage('Upload da imagem para Docker Hub') {
               steps{
                    script {
                         docker.withRegistry( '', registryCredential ) {
                         dockerImage.push()
                         }
               }
          }
          }
          stage("Iniciar serviço no docker"){
               agent {label 'swarm-manager'}
               steps{
                    sh "TAG=$BUILD_NUMBER docker stack deploy -c docker-compose.yml app"
               }
          }
    }
}