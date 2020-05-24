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
     }
}
