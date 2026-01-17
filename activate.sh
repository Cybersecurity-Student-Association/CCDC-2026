
function status() {
    sudo systemctl status "$1"
}

function start() {
    sudo systemctl start "$1"
}

function restart() {
    sudo systemctl restart "$1"
}

function stop() {
    sudo systemctl stop "$1"
}

function disable() {
    sudo systemctl disable "$1"
}

function enable() {
    sudo systemctl enable "$1"
}

TARGET_DIR="/usr/share/CCDC-2026"
sudo mkdir -p $TARGET_DIR

function backup {
    local date
    date=$(date +%s)

    local src=$1
    local dest

    if [[ -n $2 ]]; then
        dest=$2
    else
        dest="$TARGET_DIR/backups/$date"
    fi

    sudo mkdir -p "$dest"
    sudo cp -R "$src" "$dest/"
    sudo chattr -R +i "$dest$src"

    echo "Copied $src to $dest$src"
}

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


function lock() {
	sudo chattr +i -R $1
}

function unlock() {
	sudo chattr -i -R $1
}

function unlockall() {
	unlock /usr/bin
	unlock /usr/sbin
	unlock /etc
}

function lockall() {
	lock /usr/bin
	lock /usr/sbin
	lock /etc
}

export PATH=/usr/share/CCDC-2026/backups/initial/usr/bin:$PATH
export PATH=/usr/share/CCDC-2026/backups/initial/bin:$PATH