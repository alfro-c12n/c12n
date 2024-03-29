# Start emacs as a server
# emacs --daemon
# https://www.gnu.org/software/emacs/manual/html_node/emacs/Emacs-Server.html
#export EDITOR=emacsclient
#alias emacs="emacsclient -c --alternate-editor=''"

# Enables autocompletion for stormssh
# https://github.com/vigo/stormssh-completion
# autoload bashcompinit
# bashcompinit
# source /home/alfro/projects/stormssh-completion/stormssh

# Enables nice shortcuts: (Yet to finish)
# Needs installing compiz-plugins and activating the "Put" plugin
# dconf write /org/compiz/profiles/unity/plugins/put/put-next-output-key "'<Shift><Control>Down'"

alias lls=ls
alias ls='ls --color=auto'
alias ll='ls -alF'
alias ls=exa
alias cd..='cd ..'
# .emacs.d/ has the spacemacs configuration. It is used typing 'spacemacs' or 'ec'.
alias ec='env XMODIFIERS= HOME=/home/alfro/.c12n/spacemacs/home /usr/bin/emacsclient -c '
alias es='env XMODIFIERS= HOME=/home/alfro/.c12n/spacemacs/home /usr/bin/emacs --daemon -mm '
# Regular emacs has a different home, and it is used here.
alias emacs='env HOME=/home/alfro/.c12n/emacs/home /usr/bin/emacs -nw'
#Export EDITOR to use emacs by default
export EDITOR='env HOME=/home/alfro/.c12n/emacs/home /usr/bin/emacs -nw'
alias smac='env HOME=/home/alfro/.c12n/spacemacs/home /usr/bin/emacs -mm'
alias sudo='sudo ' # WORKAROUND TO USE ALIASES WITH SUDO

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# -- Shorteners --
alias ape='php bin/console'
alias drun="docker run -it "
alias dip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

# -- Utils --
alias follow="git log --topo-order -u -L $2,${3:-$2}:'$1'"
#alias prettygit='git log --color --graph --pretty=format:"%h - %an, %ar : %s"'
alias prettygit='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias csr="ffcast -s rec "
alias gitPushO='sudo -E git push origin'
alias stopwatch='while true; do echo -ne "`date +%H:%M:%S:%N`\r"; done'

# -- Fun aliases --
alias abcdefghijklmnopqrstuvwxyz='echo '\''YOU ROCK!!'\'''
alias supercaca='CACA_DRIVER=raw CACA_GEOMETRY=80x32 cacademo | cacaplay'
alias dockernyan='docker run -it supertest2014/nyan'
alias cafe='cat /dev/urandom | hexdump -C | grep '\''ca fe'\'''
alias bman='man --html=x-www-browser' #If you get a "command exited with status 3" error you need to install groff.


# -- Funcs list --

typeabc() {
    time read -r -s -p "Write abcdefghijklmnopqrstuvwxyz: " response
    if [ $response == "abcdefghijklmnopqrstuvwxyz" ]; then
        echo "Correct!";
    fi
}

whatinstalled () {
    local cmdpath=$(realpath -eP $(which -a $1 | grep -E "^/" | tail -n 1) 2>/dev/null) && [ -x "$cmdpath" ] &&
        dpkg -S $cmdpath 2>/dev/null | grep -E ": $cmdpath\$" | cut -d ":" -f 1;
}


# -- Start Galicaster Env --
gcdocs() {
    docker run -d -v /media/alfro/DATA/projects/galicaster/developer-docs:/docs jobandtalent/mkdocs serve -a 0.0.0.0:80
}






# Docker removal
drm() {
    case $1 in
        all)
            docker rm $(docker ps -q -a -f status=exited);
            ;;
        no-alias)
            #Uses a grep to include only the ones with a default alias formatting.
            docker rm $(docker ps -a -f status=exited | grep '[ ][a-z]*_[a-z]*$' | awk '{print $1}')
            ;;
        noneimgs)
            #Removes untagged images
            docker rmi $(docker images | grep "^<none>" | awk '{print $3}');
            ;;
        -a)
            if [[ -z $2 ]]; then
                echo $"Missing id/alias for the -a parameter ('drm -a' equals to 'docker rm' )"
                return
            fi
            docker rm $2
            ;;
        *)
            echo $"Usage $0 {all|no-alias|noneimgs|-a [id]} "
            ;;
    esac
}

# haha, this is basically 'git add -p'
addgit() {
    git diff $2 $1
    read -r -p "wanna add the file? [y/N] " response
    case $response in
        [yY][eE][sS]|[yY])
            git add $1
            ;;
        *)
            ;;
    esac
    git status
}

moodledocker() {
    echo "Stopping existing docker."
    docker stop alfro.moodle
    echo "Removing existing docker."
    docker rm alfro.moodle
    PMK_MOODLE="/home/alfro/projects/sf2projects/armazeg-env/pumukit2-bundles/PuMuKIT2-moodle-bundle"
    echo "Launching new docker, moodle directory: $PMK_MOODLE"
    docker run -d --name alfro.moodle -v $PMK_MOODLE:/var/www/moodlebundle/PuMuKIT2-moodle-bundle alfro/ubuntu-moodle:v8
    echo "Creating symbolic link for config.php..."
    docker exec alfro.moodle ln -s /var/www/html/moodle/config.php /var/www/moodlebundle/PuMuKIT2-moodle-bundle/Resources/data/pumoodle/config.php
    # docker start alfro.moodle &&
    # docker exec -it alfro.moodle service mysql restart &&
    # VAR=$(docker exec -it alfro.moodle service apache2 restart | grep --color=never -oP [0-9]+.[0-9]+.[0-9]+.[0-9]+)
    # sudo sed -i '/alfro.moodle.docker/c\'$VAR'    alfro.moodle.docker' /etc/hosts
    echo "Initialized moodle docker. Address=alfro.moodle.docker"
    echo " User: admin"
    echo " Password: passwordftw00Alfro."
}




#########
#ALIASES#
#########
export ANSIBLE_COW_SELECTION='random'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias jsc='rhino'
alias l='ls -CF'
alias la='ls -A'
alias resetbash='. ~/.bashrc'

gitdiff() {
    git diff -- $1 $1
}

dockrun() {
    cd /home/alfro/projects/sfprojects/configuration-management
    export ANSIBLE_COW_SELECTION=random
    echo "Ejecutando [ $2 ] para [ $1 ]"
    sudo ./arrancar_dockers.sh -d $1 -f $2
    cd -
}

dockmysql() {
    echo "--- Acceso a la base de datos de los pumukit dockers. Script dockmysql.v0.4 ---"
    if [ -z "$1" ]; then
	echo "Por favor, inserta una máquina: dockmysql [uned/cmar/koeln] -d"
    else
	sql_sentence="mysql -D"
	execute_script="true"
	if [ $2 = "-d"  ]; then
	    sql_sentence="mysqldump"
	fi
	case $1 in
	    uned)
		user="pumukit"
		pass="pumukit"
		host="uned-mysql"
		db="unedtv"
		docker_alias="micanaluned.es"
		;;
	    koeln)
		user="pmk"
		pass="koeln00"
		host="koeln-mysql"
		db="pumukit"
		docker_alias="koelnpumukit.es"
		;;
	    cmar)
		user="root"
		pass="cmar"
		host="cmar-mysql"
		db="pumukitcmar"
		docker_alias="cmarpumukit.es"
		;;
	    *)
		execute_script="false";
		;;
	esac
	if [ $execute_script = "true" ]; then
	    if [ $2 = "-e" ]; then
		echo "$sql_sentence $db -u$user -p$pass -h$host"
	    else
		if [ $2 = "-d" ]; then
	       	    docker exec -it $docker_alias $sql_sentence $db -u$user -p$pass -h$host > new_fixtures.sql
		else
		    docker exec -it $docker_alias $sql_sentence $db -u$user -p$pass -h$host
		fi
	    fi

	else
	    echo "La máquina insertada no es válida. Por favor, inserte: dockmysql [uned/cmar/koeln]"
	fi
    fi
}
dockexec() {
    case $1 in
        uned)
	    docker_alias="micanaluned.es"
	    ;;
        cmar)
	    docker_alias="cmarpumukit.es"
	    ;;
        koeln)
	    docker_alias="koelnpumukit.es"
	    ;;
        armazeg)
            docker_alias="backend.armazeg.org"
            ;;
    esac

    docker exec -it $docker_alias /bin/bash
}
addDevFixtures() {
    git checkout dev data/sql/fixtures.sql
    git add data/sql/fixtures.sql
    git commit -m "Added fixtures from dev."
}
cdpmk() {
    case $1 in
        cmar)
            cd ~/projects/sfprojects/cmar/pumukit
            ;;
        koeln)
            cd ~/projects/sfprojects/koeln/pumukit
            ;;
        uned)
            cd ~/projects/sfprojects/uned/pumukit
            ;;
        pmk1)
            cd ~/projects/sfprojects
            ;;
        pmk2)
            cd ~/projects/sf2projects
            ;;
        geant)
            cd ~/projects/sf2projects/geantpmk2/
            ;;
        moodle)
            cd ~/projects/sf2projects/moodle/
            ;;
        paella)
            cd ~/projects/paellaplayer/
            ;;
        armazeg)
            cd ~/projects/sf2projects/armazeg-env/application/
            ;;
    esac
}





# ==== ====
# UNU
alias unumysql="docker exec -it mysql.pauwes.local mysql -pgcms -D unuldapmanager"

unuldap() {
          docker exec -it ldap.pauwes.local apt update
          docker exec -it ldap.pauwes.local apt install shelldap -y
          docker exec -it ldap.pauwes.local apt install vim -y
          echo "Pass: admin"
          docker exec -it ldap.pauwes.local shelldap --server ldap.pauwes.local -D 'cn=admin,dc=teltek,dc=es' -padmin
}

dnsdockstart() {
    docker rm dnsdock
    docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name dnsdock -p 172.17.0.1:53:53/udp tonistiigi/dnsdock --nameserver="10.21.10.1:53"
}


runopencast() {
    echo "Usuarios por defecto:"
    echo " admin/opencast"
    echo " matterhorn_system_account/CHANGE_ME"
    docker run --rm --name opencast2 -it registry.teltek.es/base/matterhorn:2.1.x
}

bannerwatch() {
    export I=$(date +%s); watch -t -n 1 'T=$(date +%s);E=$(($T-$I));hours=$((E / 3600)) ; seconds=$((E % 3600)) ; minutes=$((seconds / 60)) ; seconds=$((seconds % 60)) ; echo $(printf "%02d:%02d:%02d" $hours $minutes $seconds) | xargs banner'
}
alias pulseVU="gst-launch -m pulsesrc ! level interval=1000000000 ! fakesink "

watcher() {
    export I=$(date +%s); watch -t -n 1 'T=$(date +%s);E=$(($T-$I));hours=$((E / 3600)) ; seconds=$((E % 3600)) ; minutes=$((seconds / 60)) ; seconds=$((seconds % 60)) ; echo $(printf "%02d:%02d:%02d" $hours $minutes $seconds) | toilet -F border'
}

truecolortest() {
    awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
}

#Npm local global dir
export PATH=~/.npm-global/bin:$PATH

# Prints nice calendar
when c
echo "Custom stuff loaded"
