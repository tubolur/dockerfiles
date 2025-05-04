#sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
sudo apt install docker.io

file="lazydocker_0.24.1_Linux_x86_64.tar.gz" && wget "https://github.com/jesseduffield/lazydocker/releases/download/v0.24.1/${file}" && tar -xvzf "${file}" && sudo cp lazydocker /usr/bin/lazydocker
