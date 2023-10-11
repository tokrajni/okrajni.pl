echo deploying okrajni.pl .....

#git pull
echo "+---------------------+"
echo "| pulling changes ... |"
echo "+---------------------+"

git pull

if [ $? -eq 0 ]; then
    #remove jar_backup_2 if exist
    echo "+-----------------------+"
    echo "| removing backup_2 ... |"
    echo "+-----------------------+"
    rm ~/backup/okrajni-pl_backup_2.jar

    #rename rename jar_backup_1 to jar_backup2 if exist
    echo "+-----------------------------------+"
    echo "| renaming backup_1 to backup_2 ... |"
    echo "+-----------------------------------+"
    mv ~/backup/okrajni-pl_backup_1.jar ~/backup/okrajni-pl_backup_2.jar

    #rename recent jar to jar_backup_1
    echo "+-------------------------------------+"
    echo "| renaming recent jar to backup_1 ... |"
    echo "+-------------------------------------+"
    mv target/okrajni-pl.jar ~/backup/okrajni-pl_backup_1.jar

    #create new jar
    echo "+----------------------+"
    echo "| creating new jar ... |"
    echo "+----------------------+"
    mvn clean package

    if [ $? -eq 0 ]; then
        #stop old jar
        echo "+----------------------+"
        echo "| stopping new jar ... |"
        echo "+----------------------+"
        pkill -f okrajni-pl.jar

        #start app with new jar
        echo "+----------------------+"
        echo "| starting new jar ... |"
        echo "+----------------------+"
        nohup java -jar target/okrajni-pl.jar &
    else
        echo "creating new jar failed"
        echo "starting backup_1 jar"
        nohup java -jar ~/backup/okrajni-pl_backup_1.jar &
    fi
else
    echo "+--------------------------+"
    echo "| pulling changes failed ! |"
    echo "+--------------------------+"
fi