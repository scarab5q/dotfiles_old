#!/usr/bin/env zsh
# a file to switch emacs to spacemacs and vise versa

dot_emacs=/home/jack/.emacs.d
spacemacs=/home/jack/emacs_configs/.emacs.d_spacemacs
vanilla=/home/jack/emacs_configs/.emacs.d_vanilla
current_flag=/home/jack/.emacs.d/emacs_flag.txt
spacemacs_flag=/home/jack/emacs_configs/.emacs.d_spacemacs/emacs_flag.txt
spacemacs_link=/home/jack/emacs_configs/.emacs.d_spacemacs/.emacs.d_spacemacs
vanilla_flag=/home/jack/emacs_configs/.emacs.d_vanilla/emacs_flag.txt
vanilla_link=/home/jack/emacs_configs/.emacs.d_vanilla/.emacs.d_vanilla


#function to change to vanilla_flaglla
change_to_vanilla () {
    rmtrash -rf $dot_emacs
    ln -s $vanilla $dot_emacs 
}
 
#function to change to spacemacs
change_to_spacemacs () {
    rmtrash -rf $dot_emacs 
    ln -s $spacemacs $dot_emacs 
}

# uncomment to check if this is working correctly
cat $current_flag 

#checks to see if the flags are there
if [ ! -d .emacs.d ] ;
   then 
       echo "no dot emacs linking vanilla"
       change_to_vanilla
elif [ ! -e ~/.emacs.d/init.el ] ; then
   echo "emacs has been started but not init.el \n file linking vanilla"
   change_to_vanilla 
elif cmp -s "$current_flag" "$spacemacs_flag" ;
  then
      echo 'changed to vanilla'
      change_to_vanilla
elif cmp -s "$current_flag" "$vanilla_flag"  ;
   then 
       change_to_spacemacs
       echo 'changed to spacemacs'

fi

# cmp --silent $current_flag $spacemacs_flag && echo "change_to_vanilla" || cmp --silent $current_flag $vanilla_flag && echo "change_to_spacemacs"
