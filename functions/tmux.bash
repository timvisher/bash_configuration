function new_tmux_session {
  local session_name=$1
  local base_dir=$2

  local default_command="reattach-to-user-namespace -l bash"

  cd $base_dir

  tmux new-session -d -s $session_name -n editor "$default_command"
  tmux send-keys 'emacs' 'C-m'
  tmux set-option -g default-command "$default_command"
  tmux new-window -t $session_name -n admin
  tmux new-window -t $session_name -n services
  tmux new-window -t $session_name -n db
  tmux new-window -t $session_name -n tests
  tmux select-window -t 1
  tmux select-window -t 0
  tmux attach
}

function tmux_sessions {
  if tmux ls -F'#{session_name}' > /dev/null
  then
    tmux ls -F'#{session_name}'
  fi
}

function ntmux {
  while getopts "n:b:" OPTION
  do
    case $OPTION in
      n)
        session_name="$OPTARG"
        ;;
      b)
        base_dir="$OPTARG"
        ;;
      ?)
        printf "Usage: ntmux [-n session_name] [-b base_dir]"
        exit 2
        ;;
    esac
  done

  if [ ! -z "${session_name:-}" -a ! -z "${base_dir:-}" ]
  then
    new_tmux_session $session_name $base_dir
    exit 0
  fi

  if [ ! -z "${session_name:-}" ]
  then
    for s in $(tmux_sessions)
    do
      if [[ $s == *$session_name* ]]
      then
        tmux attach -t $s
        exit 0
      fi
    done

    while read gp
    do
      local project_dir=$(echo "$gp" | cut -f1)
      local project_name=$(echo "$gp" | cut -f2)
      if [[ $project_name == *$session_name* ]]
      then
        new_tmux_session $project_name $project_dir
        exit 0
      fi
    done < ~/.cache.git_projects
  fi

  # If base_dir only specified
  #   TODO: ???

  ntmux -n default -b ~
}
