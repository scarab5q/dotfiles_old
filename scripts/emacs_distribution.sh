#!/usr/bin/env sh

# Simplifies running Emacs from an alternative $HOME in order to
# experiment with alternative configurations without affecting your
# default (~/.emacs.d) config.
#
# Run "emacs-distribution --help" for usage details.
#
# n.b. This script is essentially just a wrapper for the command:
# env HOME=$HOME/emacs/distributions/NAME emacs

# Version 1.01
# Author: Phil S.
# URL: http://www.emacswiki.org/emacs/emacs-distribution

# Dependencies:
# Requires the enhanced (non-POSIX) GNU getopt utility.


# Commentary:

# For lack of a better term, I am referring to these independent
# configurations as Emacs "distributions".
#
# Distributions will live under ~/emacs/distributions/
# Each distribution will serve as an alternative $HOME directory, and
# therefore the actual Emacs configuration will typically live in a
# .emacs.d sub-directory of that distribution.
#
# Distributions shouldn't interact with each other, so you can run
# them together and have multiple side-by-side emacs instances, each
# using a different configuration.

# TO DO:
# Rename to emacs-sandbox and ~/.emacs.d.sandboxes/
# Allow cloning of a single init file (all supported formats).
# Post-processing of repositories to support other directory structures.
# Support archive formats?
# (or a generic "fetch a thing" command to cover files/archives/URLs/repos/etc?)


# Running a distribution:
# -----------------------
# To run an Emacs distribution (whether an existing distribution
# OR a new blank-slate distribution), simply use:
# $ emacs-distribution NAME
#
# If NAME is a new distribution, the necessary directories and init
# file will be created first before running Emacs. As a convenience,
# the new init.el file will also be visited the first time a new
# distribution is started, so that you can immediately make any desired
# changes. On subsequent starts, this file is not automatically visited.
#
# Once running, you may wish to install new packages using the package
# manager (M-x package-install), or follow the installation directions
# for any other libraries you are interested in -- remembering to
# substitute the path "~/emacs/distributions/NAME/" for "~/" if placing
# files under your home directory from outside of the running Emacs
# instance (inside that instance "~/" will be the distribution's home).


# Pre-packaged distributions, and --clone:
# ----------------------------------------
# Some configurations such as Emacs Prelude or Emacs Live come ready-
# made with an init.el file, and need only be installed to the
# appropriate .emacs.d directory. If the repository (or otherwise)
# represents the .emacs.d directory, then you can clone it directly:
#
# $ emacs-distribution prelude --clone="https://github.com/bbatsov/prelude.git"
# $ emacs-distribution emacs-live --clone="https://github.com/overtone/emacs-live.git"
#
# In other scenarios, you can manually copy the appropriate directory as
# ~/emacs/distributions/NAME/.emacs.d and then run the distribution with:
# $ emacs-distribution NAME
#
# Distributions can also be cloned from the filesystem.
# The uses of --clone are as follows:
#
# $ emacs-distribution --clone NAME
#   Creates a copy of ~/.emacs.d as NAME.
#
# $ emacs-distribution --clone=DIST NAME
#   Creates a copy of existing distribution DIST as NAME.
#
# $ emacs-distribution --clone=PATH/TO/DIR NAME
#   Creates a copy of existing directory DIR as NAME.
#   DIR will be copied as the .emacs.d directory, unless it
#   contains a .emacs.d directory.
#
# $ emacs-distribution --clone=REPO NAME
#   Clones version-control repository REPO as NAME.
#   (Only git repositories are supported at this time.)
#   REPO is assumed to represent the .emacs.d directory.
#   If it does not, you will need to manually modify the
#   distribution directory.


# Default command-line options and per-distribution Emacs versions:
# -----------------------------------------------------------------
# To use a specific version of Emacs for a distribution, either
# specify the emacs command to run using the --emacs="COMMAND" option,
# or place a file named "emacs-command" in the distribution directory
# containing the command to run. If this file exists, it will be used
# automatically (unless overridden by --emacs="COMMAND").
#
# e.g.:
# $ emacs-distribution --emacs=emacs-22.3 my-emacs-22-config
# $ echo "emacs-22.3" >~/emacs/distributions/my-emacs-22-config/emacs-command
# $ emacs-distribution my-emacs-22-config
#
# Note that you may specify emacs command-line options as part of the
# emacs command with either of these techniques. Therefore if you wish
# to use certain options by default for a given distribution, the
# simplest way is to specify them in an "emacs-command" file.
#
# To pass options to emacs from the command line without specifying an
# emacs command, simply use the -- argument first.  All subsequent
# arguments will be passed to Emacs. e.g.:
# $ emacs-distribution foo -- --debug-init --title="Foo distribution"


# Upgrading Emacs:
# ----------------
# This script facilitates a fairly useful approach for upgrading to
# a new version of Emacs (provided you are able to install the new
# version alongside the old).
#
# Simply set up a copy of your existing config as a new distribution
# to use with the new Emacs, until you're convinced everything is
# working. This will enable you to debug and edit the new config
# without the risk of breaking your existing one.
#
# Or you could flip this approach around, and instead make the
# original config into a distribution, in case you need it as a
# back-up.


# Notes on relocating $HOME:
# --------------------------
# As already indicated, this script works simply by setting an
# alternative $HOME directory for Emacs to see, which ensures that
# the 'distribution' is separate from your default configuration.
#
# See C-h i g (emacs) Find Init RET
#
# The down-side to this technique is that Emacs won't see all your
# other dot files (because it will be looking in $HOME), and so
# running other processes from within Emacs won't necessarily work as
# normal; but that's not likely to be a huge issue if you're just
# experimenting, and you can always symlink or copy the bits you need.
#
# The benefit is that if anything in the distribution writes files to
# the home directory, they can't clobber your real files, or add any
# unwanted cruft.


distrodir=${HOME}/emacs/distributions

# Process command line options
opts=$(getopt -o hd:e: -l help,distro:,emacs:,clone::,source-type:,delete -n "$(basename $0)" -- "$@")
if [ $? -eq 0 ]; then
	eval set -- ${opts}
	while true; do
		case "$1" in
			( -h|--help   ) help=1; shift; break;;
			( -d|--distro ) {
				shift; eval path=$1; # eval needed to handle ~/
				fakehome=$(readlink -f "${path}"); # get absolute path
				distro=$(basename $1); shift;
			} ;;
			( -e|--emacs  ) shift; emacs=$1; shift;;
			( -c|--clone  ) clone=1; shift; source=$1; shift;;
			( -t|--source-type ) shift; vcs=$1; shift;;
			( --delete    ) delete=1; shift;;
			( --          ) shift; break;;
		esac
	done
else
	help=1 # getopt returned (and reported) an error.
fi

# Process remaining (non-option) arguments
if [ -z "${fakehome}" ]; then
	if [ -n "$1" ]; then
		distro=$1
		fakehome="${distrodir}/${distro}"
		shift
	else
		help=1
	fi
fi

if [ -n "${help}" ]; then
	echo
	echo "Usage:"
	echo "$(basename $0) [ --emacs=COMMAND ] [ --clone[=SOURCE] ]"
	echo "    [ --source-type=TYPE ] [ NAME | --distro=PATH/TO/DIR/NAME ]"
	echo "    [ -- [ EMACS-OPTIONS ... ] ]"
	echo "$(basename $0) [ -e COMMAND ] [ -c [SOURCE] ] [ -t TYPE ]"
	echo "    [ NAME | -d PATH/TO/DIR/NAME ] [ -- [ EMACS-OPTIONS ... ] ]"
	echo "$(basename $0) --delete NAME"
	echo
	echo "Uses ${distrodir}/NAME unless --distro is specified."
	echo
	echo "Arguments following -- will be passed to Emacs. e.g.:"
	echo "$(basename $0) mydistro -- --title='mydistro' --debug-init"
	echo
	echo "--emacs=\"COMMAND\" specifies a non-default emacs command."
	echo "Command-line options may also be included. To automate this for"
	echo "a given distribution, place the command to run in the file:"
	echo "${distrodir}/NAME/emacs-command"
	echo
	echo "The --clone option will initialise a new distribution from an"
	echo "existing source (~/.emacs.d by default, or a named distribution,"
	echo "or a named directory, or a version control repository. It is"
	echo "assumed that the repository represents the .emacs.d directory."
	echo
	echo "The --source-type option indicates the version-control system"
	echo "for the repository, if it cannot be ascertained automatically"
	echo "from SOURCE. Valid options are: bzr, cvs, darcs, git, hg, svn."
	echo
	echo "The --delete option will remove (rm -rf) the directory of the"
	echo "specified (NAME) distribution."
	echo
	exit
fi

# Deleting a distribution.
if [ -n "${delete}" ]; then
	if [ ! -d "${fakehome}" ]; then
		echo "No distribution at ${fakehome}"
		exit 1
	fi
	read -p "rm -rf \"${fakehome}\" (Yes/[No]) ? " delete
	if [ "${delete}" = "yes" ] || [ "${delete}" = "Yes" ]; then
		rm -rf "${fakehome}"
		if [ $? -eq 0 ]; then
			echo "Deleted distribution ${distro}"
			deleted=1
		fi
	fi
	if [ -z "${deleted}" ]; then
		echo "Exiting."
	fi
	exit # Exit here, regardless.
fi

# Create the distribution.
emacsd="${fakehome}/.emacs.d"
if [ ! -d "${emacsd}" ]; then
	# Are we cloning an existing source?
	if [ -n "${clone}" ]; then
		# Determine source type.
		if [ -z "${vcs}" ]; then
			if [ -z "${source}" ]; then
				source="${HOME}/.emacs.d"
			elif [ -d "${distrodir}/${source}" ]; then
				source="${distrodir}/${source}"
			elif [ "${source%.git}" != "${source}" ]; then
				vcs=git
			elif [ "${source#git://}" != "${source}" ]; then
				vcs=git
			elif [ "${source#cvs://}" != "${source}" ]; then
				vcs=cvs
			elif [ "${source#svn*://}" != "${source}" ]; then
				vcs=svn
			fi
		fi
		# Copy from source.
		if [ -n "${vcs}" ]; then
			# Clone from VCS.
			case "${vcs}" in
				( bzr   ) bzr checkout "${source}" "${emacsd}"; x=$?; break;;
				( cvs   ) cvs checkout -d "${emacsd}" "${source}"; x=$?; break;;
				( darcs ) darcs get "${source}" "${emacsd}"; x=$?; break;;
				( git   ) git clone "${source}" "${emacsd}"; x=$?; break;;
				( hg    ) hg clone "${source}" "${emacsd}"; x=$?; break;;
				( svn   ) svn checkout "${source}" "${emacsd}"; x=$?; break;;
				( *     ) echo "Unsupported source type."; x=1; break;;
			esac
			if [ ${x} != 0 ]; then
				echo "Error cloning repository."
				exit
			fi
		elif [ -d "${source}" ]; then
			# Copy directory.
			if [ -d "${source}/.emacs.d" ]; then
				cp -r "${source}" "${fakehome}"
			else
				mkdir -p ${fakehome}
				cp -r "${source}" "${emacsd}"
			fi
		fi
	else
		# Not cloning. Create blank-slate distribution.
		mkdir -p "${emacsd}"
		init="${emacsd}/init.el"
		# touch ${init}
		echo ";; user init file for '${distro}' distribution.\n" >${init}
		set -- "$@" "${init}" # Visit the new init file.
	fi
elif [ -n "${clone}" ]; then
	echo "Cannot clone into existing distribution. Exiting."
	exit
fi

# Run the distribution.

# Check for a non-standard emacs executable.
# --emacs takes precedence; then an "emacs-command" file; finally "emacs".
if [ -z "${emacs}" ]; then
	if [ -f ${fakehome}/emacs-command ]; then
	emacs=$(cat ${fakehome}/emacs-command)
	fi
fi
if [ -z "${emacs}" ]; then
	emacs=emacs
fi

# Because we eval the final command, "$@" (which would normally be
# identical to the following substitutions) isn't sufficient to pass
# additional arguments if they are quoted. Instead we list them out
# individually as "${1}" "${2}" "${3}" etc... (in which format we are
# assured that the argument values themselves cannot cause further
# quoting issues).
args=$(seq -s' ' -f '"${%1.0f}"' 1 $#)
# This approach was gleaned from the following article and its comments:
# http://www.yosefk.com/blog/passing-shell-script-arguments-to-a-subprocess.html

# Finally, run the command.
# echo exec env HOME=${fakehome} ${emacs} $args
eval exec env HOME=${fakehome} ${emacs} ${args}

# Local Variables:
# indent-tabs-mode: t
# tab-width: 4
# End:
