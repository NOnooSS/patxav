if pidof -o %PPID -x "$0"; then
echo "$(date "+%d.%m.%Y %T") Already running, exiting."
exit 1
fi
	
var=$(ls -a /home/%SEEDUSER%/Medias/%FILMS% | sed -e "/\.$/d" | wc -l)
var1=$(ls -a /home/%SEEDUSER%/Medias/%SERIES% | sed -e "/\.$/d" | wc -l)
var2=$(ls -a /home/%SEEDUSER%/Medias/%ANIMES% | sed -e "/\.$/d" | wc -l)
var3=$(ls -a /home/%SEEDUSER%/Medias/%MUSIC% | sed -e "/\.$/d" | wc -l)

## On vérifie si les dossiers sont vides, dans le cas contraire plex_autoscan se lance
if [ $var -ge 1 -o $var1 -ge 1 -o $var2 -ge 1 -o $var3 -ge 1 ]; then
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
FILES=/home/%SEEDUSER%/Medias/*/*/*
for f in $FILES
do
echo "$f"
curl -d "eventType=Manual&filepath=$f" http://%ACCESSDOMAIN%:%PORT%/9c4b81fe234e4d6eb9011cefe514d915
done
					
# restore $IFS
IFS=$SAVEIFS
else 
exit 0
fi