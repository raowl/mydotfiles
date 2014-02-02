#!/bin/bash

# corresponding to each array below in order
CHOICES=('tutorial' 'h')

#bash associative array for each project information
declare -A tutorial
tutorial[path]=/home/raowl/lzone/pyramidtut/tutorial
#for multiple services just comma separated
tutorial[systemd_services]=postgresql
tutorial[framework]=pyramid

declare -A h
h[path]=/home/raowl/projects/h/h
h[systemd_services]=elasticsearch
h[framework]=pyramid


commonenv()
{
	eval "path=\${$resp[path]}"
	eval "services=\${$resp[systemd_services]}"
	eval "framework=\${$resp[framework]}"

	# start each of the systemd services for chosen project
    for service_name in $(echo $services|tr ',' '\n'); do
    	sudo systemctl start $service_name
    	if [ "$service_name" == "elasticsearch" ]; then
    		sleep 8
        fi
    done


    # the name of your primary tmux session
    SESSION=$resp
    # your IRC nickname
    IRC_NICK=raowl
    
    # if the session is already running, just attach to it.
    tmux has-session -t $SESSION
    if [ $? -eq 0 ]; then
        echo "Session $SESSION already exists. Attaching."
        sleep 1
        tmux attach -t $SESSION
        exit 0;
    fi
     
    # create a new session, named $SESSION, and detach from it
    tmux new-session -d -s $SESSION
     
    # 0 - IRC
    tmux new-window    -t $SESSION:1 -k -n irc -d irssi # weechat-curses
    tmux set-window-option -t $SESSION:0 automatic-rename off
    #tmux set-window-option -t $SESSION:0 monitor-content $IRC_NICK
    tmux rename-window -t $SESSION:1 -n irc
    # 1 - pserve console
    if [ $SESSION == 'h' ]; then
       tmux new-window    -t $SESSION:2 -n pserve "cd $path; cd ..; ./run"
    else
        tmux new-window    -t $SESSION:2 -n pserve "cd $path; . ../bin/activate; pserve --reload development.ini"
    fi
     
    tmux new-window    -t $SESSION:3 -n $resp "cd $path; export tmux_project_name=$SESSION; vim"

    tmux select-window -t $SESSION:3
    tmux attach -t $SESSION
}

resp=$(zenity --width=200 --height=150 --list --column "" --title="choice" ${CHOICES[@]})
commonenv
