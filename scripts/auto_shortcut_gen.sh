#!/usr/bin/env zsh

# TODO add recursive folder options

# folders=cat ~/scripts/folders | sed -r 's/\w+\=\"(.+)\"\s*/\1/' | echo
# folders=( $(cat ~/scripts/folders) )
# folders=cat ~/scripts/folders | grep -oP '^\w+'
# folders=cat ~/scripts/folders

home=$(grep -oP "home\s*(.+)" ~/scripts/folders | sed -rn "s/home\s*(.+)/\1/p")
# echo "home = $home"
folder_file=~/scripts/folders
# folder_names_and_aliases=$(cat $folder_file | sed -rn  's/([a-zA-Z_\.\-]+)\s*([a-z]+)/\1 \2/p')
# echo "

# NAMES AND ALIASES


# $folder_names_and_aliases

 # "
# folder_aliases=$($folder_names_and_aliases | sed -rn 's/[a-zA-Z_\.\-]+\s([a-z]+)/\1/p')
# echo "


# FOLDER ALIASES


# $folder_aliases
# "
# folder_names=$(cat ~/scripts/folders | sed -rn  's/([a-zA-Z_\.\-]+)\s*([a-z]+)/\2=\"\~\/\1\/\"/p')
# folder_aliases=$(cat ~/scripts/folders | sed -rn  's/([a-zA-Z_\.\-]+)\s*([a-z]+)/\2/p')
# echo "FOLDER NAMES\n\n\n"
# for i in $folder_names; do
    # printf "$i"
# done

# $folder_aliases > ~/shortcuts
# echo "#!/usr/bin/env zsh


# ---- SHORTCUTS ----




# "
# cat ~/shortcuts

# folder_names=$(cat ~/scripts/folders | sed -rn  's/([a-zA-Z\_\.\-]+)\s*([a-z]+)[\-r\s\n]+/\1/p')
folder_names=($(cat $folder_file | grep -oP "^[a-zA-z\_\-\.]+\s*"))
echo "
folder names
$folder_names





DIRECTORIES


"

for i in $folder_names; do
    printf "$i\n"
    folders_2=$(ls -a $HOME/$i | grep -l "^d" )
    for j in $
    echo "\n"
done
	 

