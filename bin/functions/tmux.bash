#!/usr/bin/env bash

function new_tmux_session {
  local session_name=$1
  local base_dir=$2

  local default_command="which reattach-to-user-namespace > /dev/null 2>&1 && reattach-to-user-namespace -l bash || bash"

  (
    cd $base_dir

    tmux new-session -d -s $session_name -n editor "$default_command"
    if [[ Darwin = $(uname) ]]
    then
      tmux send-keys 'emacs' 'C-m'
    else
      tmux send-keys 'TERM=xterm-256color emacs' 'C-m'
    fi
    tmux set-option -g default-command "$default_command"
    tmux new-window -t $session_name -n admin
    tmux new-window -t $session_name -n services
    tmux new-window -t $session_name -n db
    tmux new-window -t $session_name -n tests
    tmux select-window -t 1
    tmux select-window -t 0
  )

  tmux attach -t $session_name
}

function tmux_sessions {
  if tmux ls -F'#{session_name}' > /dev/null
  then
    tmux ls -F'#{session_name}'
  fi
}

function ntmux {

  local session_name=
  local base_dir=
  local dryrun=
  local OPTIND=

  while getopts "n:b:d" OPTION
  do
    case $OPTION in
      n)
        local session_name="$OPTARG"
        ;;
      b)
        local base_dir="$OPTARG"
        ;;
      d)
        local dryrun=1
        ;;
      ?)
        printf "Usage: ntmux [-n session_name] [-b base_dir] [-d]"
        return 2
        ;;
    esac
  done

  if [ ! -z "${session_name:-}" -a ! -z "${base_dir:-}" ]
  then
    if [ $dryrun ]
    then
      echo new_tmux_session $session_name $base_dir
    else
      new_tmux_session $session_name $base_dir
    fi
    return 0
  fi

  if [ ! -z "${session_name:-}" ]
  then
    for s in $(tmux_sessions)
    do
      if [[ $s == *$session_name* ]]
      then
        if [ $dryrun ]
        then
          echo tmux attach -t $s
        else
          tmux attach -t $s
        fi
        return 0
      fi
    done

    local project_dir=
    local project_name=
    local IFS=$'\n'

    for gp in $(< ~/.cache.git_projects )
    do
      project_dir=$(echo "$gp" | cut -f1)
      project_name=$(echo "$gp" | cut -f2)
      if [[ $project_name == *$session_name* ]]
      then
        if [ $dryrun ]
        then
          echo new_tmux_session $project_name $project_dir
        else
          new_tmux_session $project_name $project_dir
        fi
        return 0
      fi
    done
  fi

  # If base_dir only specified
  #   TODO: ???

  if [ $dryrun ]
  then
    echo ntmux -n default -b ~
  else
    ntmux -n default -b ~
  fi
}
