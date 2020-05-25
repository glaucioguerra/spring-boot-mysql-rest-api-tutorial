pipeline {
     agent any
     stages {
          stage("Compilar") {
               steps {
                    sh 'mvn compile'
               }
          }
          stage("Iniciar DB"){
               steps {
                    sh "docker-compose create mariadb"
               }
          }
          stage("Empacotar") {
               steps {
                    sh 'mvn package -DskipTests'
               }
          }
          stage("Iniciar images"){
               steps {
                    sh "docker-compose up"
               }
          }
     }
}
