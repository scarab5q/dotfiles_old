function brightnessup
	if [ -z $argv[1] ]

		light -A 5
	else
		light -A $argv[1]
	end
end

function brightnessdown
	if [ -z $argv[1] ]

		light -U 5
	else
		light -U $argv[1]
	end
end

function volumeup
   pactl set-sink-volume 0 +2% # 1 is the device (could change)
end

function volumedown
  pactl set-sink-volume 0 -2% # 1 is the device (could change)
end

function volumemute
  pactl set-sink-mute 0 toggle
end

function ccd
  cd (chezmoi source-path)
end

function cef
  set file (chezmoi managed -i files | sed "s/.*chezmoi//g" |fzf )
  if set -q $file
    chezmoi edit $file
    echo "do you want to chezmoi apply?"
    read response
    if string match -r 'y|Y|yes|Yes' $response
      echo applying
      chezmoi apply
    else 
      echo not applying
    end
  end
end


function ftpane
  local panes current_window current_pane target target_window target_pane
  set panes (tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  set current_pane (tmux display-message -p '#I:#P')
  set current_window (tmux display-message -p '#I')

  set target (echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  set target_window (echo $target | awk 'BEGIN{FS=":|-"} {print$argv[1]}')
  set target_pane (echo $target | awk 'BEGIN{FS=":|-"} {print$argv[2]}' | cut -c 1)

  if [[ $current_window -eq $target_window ]];
    tmux select-pane -t $target_window.$target_pane
  else
    tmux select-pane -t $target_window.$target_pane &&
    tmux select-window -t $target_window
  end
end

function cinto
    cat <'EOF' >>$argv[1]
end

# function fkill
#     if [ "$UID" != "0" ];
#         set pid (ps -f -u $UID | sed 1d | fzf -m | awk '{print $argv[2]}')
#     else
#         set pid (ps -ef | sed 1d | fzf -m | awk '{print $argv[2]}')
#     end
#     if set -q $pid
#         echo $pid | xargs kill -${1:-9}
#     end
# end


# # function to use path extractor. A tool that extracts paths from stdout
# function pe
#     path-extractor
# end

# # a function to list all directories and have them filterable and searchable
# function lff
#     ls -a1 | fzf
# end

# # a function to change directories using fzf
# function cz
#     set d (fasd -dlR | fzf)
#     printf "%s %s\n" "cd" "$d" >> ~/.zhistory
#     cd $d
# end

# function cf
#     cd ( fd -t d | fzf )
# end

# # a function to change directories using fzf
# function cF
#     cd ( fd . -t d ~ | fzf )
# end

# # a function to change directories using fzf
# function cfa
#     cd ( fd -t d --hidden | fzf )
# end

# # a function to change to any directory searched from the home directory
# function cFA
#     cd ( fd . -t d --hidden ~ | fzf )
# end

# function fr
#     $argv[1] ( sk --ansi -i -c "rg set --color always -i --line-number --hidden '{} .'" --preview "preview.sh {}"  )
# end

# fg () {
#     $argv[1] (exa -a1r | sk --ansi)
# }




# function ea 
#     if [  -eq 0 ];
#         set file  ( fd -t f --hidden | sk) || return 1
#         $EDITOR $file
#     elif [ $argv[1] = '-f' ];
#         set file  ( fd -t f --hidden | fzy) || return 1
#         $EDITOR $file
#     end
# end





function mcd 
    mkdir -p $argv[1]
    cd $argv[1]
end

