!/bin/bash
#cd ~/x
path="./home/$HOSTNAME/.bashrc"

echo "# some ls aliases"
echo "alias ll='ls -alh'" >> $path
echo "alias la='ls -alhtr'" >> $path

# cd aliases
if grep -Fwq "#some cd aliases"; then
        echo "# some cd aliases"
        echo "alias cdr='cd /'" >> $path
else
        echo "cd aliases already present"
fi

# shutdown aliases
if grep -Fwq "#some shutdown aliases"; then
        echo "#some shutdown aliases"
        echo "alias shutdown='shutdown -h now'" >> $path
else
        echo "alias already present"
fi

# rm aliases
if grep -Fwq "#some rm aliases" ~/.bashrc; then
        echo "#some rm aliases"
        echo "alias rmdir='rm -fr'" >> $path
else
        echo "rm aliases already present"
fi

# nmap aliases && installation 
answer=""

if command -v nmap >/dev/null 2>&1; then
    while true; do
        read -p "Installarlo? (yes/y/no/n): " answer

        # Uscire dal ciclo se l'utente dice no
        if [[ "$answer" == "n" || "$answer" == "no" || "$answer" == "N" ]]; then
            break
        fi

        # Installare se dice yes/y
        if [[ "$answer" == "y" || "$answer" == "yes" || "$answer" == "YES" ]]; >
            sudo apt install nmap -y
            break
        fi

        echo "Risposta non valida. Riprova."
    done

    if grep -Fwq "#some nmap aliases" ~/.bashrc; then
        echo "#some nmap aliases"
        echo "alias whois='nmap -A'" >> $path
        echo "alias netscan='nmap -sn'" >> $path
    else
        echo "nmap aliases already present"
    fi

else
    echo "nmap non installato"
fi

