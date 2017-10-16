# postgres-practical-work

Here you can find materials for finishing your practical work: you have to finish all queries. 

Within this project you'll find:
 - import-database.sh file: this is the installation script, it setups for you:
    - docker if you do not have
    - docker-compose if you do not have
    - it pulls the postgres:9.6 image if you do note have
    - and runs the importing script of example.dump in to your docker machine
 - docker-compose.yml: the docker-compose script to run your docker machine
 - example.dump: database file
## How to run:
First you need to get the project, so you have to create an account on github then clone the project in your home folder:
```
cd
git clone https://github.com/sidwise/postgres-practical-work.git
cd postgres-practical-work
```
to run the installation script:
```
bash import-database
```
Once the script finishes its job, (ignore any warning caused by missing user roles), you can access the psql command line by:
```
docker exec -it database /bin/bash
psql -U isi -d isi
\dt
```
Now you can execute your queries;


