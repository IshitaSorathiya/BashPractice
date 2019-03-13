#!/bin/bash

for table in $( mysql -N -u cs18200403 -p8HeXtwD6 -e "use cs18200403; show tables;")
do

	#Using CSV
	mysql -u cs18200403 -p8HeXtwD6 -e "use cs18200403; select * from $table" | sed 's/\t/,/g' > $table.csv
	mongoimport --db cs18200403 --collection $table --type csv --file $table.csv --headerline
	
done
