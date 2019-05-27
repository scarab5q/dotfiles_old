# Defined in - @ line 1
function nrs --description 'alias nrs sudo nixos-rebuild switch'
	sudo nixos-rebuild switch --show-trace $argv;
end
