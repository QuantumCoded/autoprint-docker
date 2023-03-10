set -x
cupsd -f &
sleep 10
su -c "lpadmin -m everywhere -v ipp://$PRINTER -p printer"

while inotifywait -e close_write -e moved_to /var/to-print; do
    for DOC in /var/to-print/*; do
        lp -d printer $DOC && rm $DOC
        # echo Printing $DOC
        # lpstat
        # while [[ -n `lpstat -W not-completed` ]]; do sleep 1; done
        # echo Done, REMOVE!
    done
done
