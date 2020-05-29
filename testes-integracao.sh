#/bin/bash
curl http://8090/api/notes
curl -H "Content-Type: application/json" --data @note.json http://localhost:8090/api/notes
curl http://localhost:8090/api/notes
curl -X DELETE -H "Content-Type: application/json" http://localhost:8090/api/notes/1
curl http://localhost:8090/api/notes