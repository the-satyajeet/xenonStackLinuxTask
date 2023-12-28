#!/bin/bash
# display help
display_help() { 
	echo "Usage: internsctl [OPTIONS] COMMAND" 
	echo "Custom Linux command for operations." 
	echo "" 
	echo "Options:" 
	echo " -h, --help Show this help message and exit" 
	echo " --version Show version information" 
	echo "" 
	echo "Commands:" 
	echo " cpu getinfo Get CPU information" 
	echo " memory getinfo Get memory information" 
	echo " user create Create a new user" 
	echo " user list List all users" 
	echo " --sudo-only List users with sudo permissions only" 
	echo " file getinfo Get information about a file" 
	echo " [options] Specify  information options (e.g., --size, --permissions, --owner,   --last-modified)" 
	echo ""
}

# display version
display_version() { 
	echo "internsctl v0.1.0"
}
# get CPU information
get_cpu_info() { 
	lscpu
}
# get memory information
get_memory_info() { 
	free
}
# create a new user
create_user() { 
	if [ -z "$1" ]; then 
		echo "Error: Username not provided." 
		exit 1
    	fi 
	sudo useradd -m "$1" 
	echo "User $1 created successfully."
}
# list users
list_users() { 
	if [ "$1" == "--sudo-only" ]; then 
		getent group sudo | cut -d: -f4
    	else 
		getent passwd | cut -d: -f1 
	fi
}
# get file information
get_file_info() { 
	if [ -z "$2" ]; then 
		echo "Error: File name not provided." 
		exit 1
	fi 
	file="$2" 
	case "$1" in 
		"--size" | "-s") stat -c %s "$file" ;; 
        	"--permissions" | "-p") stat -c %A "$file" ;; 
		"--owner" | "-o") stat -c %U "$file" ;; 
		"--last-modified" | "-m") stat -c %y "$file" ;;
	 *) echo "Error: Invalid option." && exit 1 ;;
    esac
}
# driver code
case "$1" in 
	"cpu" ) 
	shift 
	case "$1" in 
		"getinfo" ) get_cpu_info ;; 
		* ) display_help ;;
        esac
        ;;
    "memory" ) 
	shift 
	case "$1" in 
		"getinfo" ) get_memory_info ;; 
		* ) display_help ;;
        esac
        ;;
    "user" ) 
	shift 
	case "$1" in 
		"create" ) shift && create_user "$@" ;; 
           	"list" ) shift && list_users "$@" ;; 
		* ) display_help ;;
        esac
        ;;
	"file" )
		shift 
		case "$1" in 
			"getinfo" ) 
			shift && get_file_info "$@" ;;
            * ) display_help ;; 
	esac
        ;;
    	"--help" | "-h" ) display_help ;; 
	"--version" ) display_version ;; 
	* ) display_help ;;
esac 
exit 0
