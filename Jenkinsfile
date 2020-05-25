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
                    sh 'mvn package'
               }
          }
          stage("Iniciar images"){
               steps {
                    sh "docker-compose up"
               }
          }
     }
}
