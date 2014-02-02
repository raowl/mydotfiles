#!/bin/bash

# start 

CHOICES=('dual' 'webdev')


# open vim session corresponding to the response in the menu
dualenv()
{
    # the name of your primary tmux session
    SESSION=dual
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
     
    # Now populate the session with the windows you use every day
    # Some windows I specifically want at a particular index.
    # I always want IRC in window 0 and Email in window 1.
     
    # 0 - IRC
    tmux set-window-option -t $SESSION -g automatic-rename off
    tmux new-window    -t $SESSION:0 -k -n irc -d irssi # weechat-curses
    tmux set-window-option -t $SESSION:0 automatic-rename off
    #tmux set-window-option -t $SESSION:0 monitor-content $IRC_NICK
    tmux rename-window -t $SESSION:0 -n irc
    # 1 - Mail
    tmux new-window    -t $SESSION:1 -n mail alpine
    # 2 - Music (on one workstation, nothing on another)
    # So that I can quickly hit ^b2<spacebar> to pause my tunes, I always put music in window 2.
    # Makefile target does this: mpg123 --shuffle --control --list *m3u
    #tmux new-window -t $SESSION:2 -n music 'cd ~/Music; make music'
    tmux new-window    -t $SESSION:2 -n temp # just to leave 2 empty
     
    # After those base windows are statically defined, what follows depends where
    # I'm working and what my focus is.
    # So these new windows will just  number sequentially.
    tmux new-window    -t $SESSION:3 -n work 
    tmux send-keys -t $SESSION:3 "cd ~/public_html/wordpress; vim -S ~/.vim/sessions/$resp.vim" C-m

    tmux new-window    -t $SESSION -a -n root  'sudo su -'
    tmux new-window    -t $SESSION -a -n fw    'ssh root@fw'
    tmux new-window    -t $SESSION -a -n virt  'ssh root@sammy'
    tmux new-window    -t $SESSION -a -n lime  'ssh root@lime'
    tmux new-window    -t $SESSION -a -n scsi  'ssh root@donkey'
    tmux new-window    -t $SESSION -a -n back  'ssh root@bacula'
    tmux kill-window   -t $SESSION:2 # just want to leave slot 2 empty
    #
     
    # all done. select starting window and get to work
    # you may need to cycle through windows and type in passwords
    # if you don't use ssh keys
    tmux select-window -t $SESSION:0
    tmux attach -t $SESSION

}
#start web development 
sudo systemctl start mysqld httpd
resp=$(zenity --width=200 --height=150 --list --column "" --title="choice" ${CHOICES[@]})

case "$resp" in
    "dual")
       dualenv 
        ;;
    "webdev" | "other")
        echo "webdevenv"
        ;;
    *)
       echo "no haga nada"
        ;;
esac 


