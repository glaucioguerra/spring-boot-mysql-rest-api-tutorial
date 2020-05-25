pipeline {
     agent any
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
          stage ("wait_for_testing")
          {
               sh 'sleep 30'
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
     }
}
