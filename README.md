# README der Rails API
Das ist kein Standard-Rails Projekt da es so erstellt wurde, dass keine HTML-Views benötigt werden, d.h. das Projekt ist ein API-only Projekt.
## Installation
Installiert euch ein aktuelles Ruby >2 und geht dann in den Root-Ordner und führt  
`bundle install` aus.  
Passt eure `config/database.yml` an eure Datenbank an.  
Erstellt die Datenbank  
`rails db:create`  
migriert die Datenbank  
`rails db:migrate`  
migriert die Seeds  
`rails db:setup`  
und nun
`rails s -p3001`  
You're ready to go!
## Code
Eigentlich standard nur mit der Ausnahme, dass wir für die API jbuilder verwenden.  
D.h. im Controller ist NUR die Logik zum Finden des Objekts also Quasi der Query.  
Im View wiederum kümmern wir uns um den Aufbau, des JSON-Objekts.




####Dont Ignore

GET	Retrieve and only retrieve data. Never change any data within a GET request.
POST	Create a new resource
PATCH	Update an existing resource (partially)
DELETE	Remove a resource
