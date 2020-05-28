#/bin/bash
curl http://8090/api/notes
curl -H "Content-Type: application/json" --data @note.json http://localhost:8080/api/notes
curl http://localhost:8080/api/notes
curl -X DELETE -H "Content-Type: application/json" http://app01:8080/api/notes/1