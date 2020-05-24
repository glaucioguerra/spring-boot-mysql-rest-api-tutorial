pipeline {
     agent any
     stages {
          stage("Checkout") {
               steps {
                    git url: 'https://github.com/glaucioguerra/spring-boot-mysql-rest-api-tutorial.git'
               }
          }
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
     }
}
