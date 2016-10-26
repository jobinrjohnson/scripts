if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt-get update
sudo apt-get install bison build-essential curl flex git git-core gnupg gperf libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk2.8-dev libxml2 libxml2-utils lzop openjdk-7-jdk openjdk-7-jre pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev unzip lib32readline-gplv2-dev lib32z1-dev make python-networkx zlib1g-dev:i386 phablet-tools

mkdir -p ~/bin
PATH=~/bin:$PATH  
cd ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo  
chmod a+x ~/bin/repo

echo "Please enter your name for git: "
read git_name
git config --global user.name "$git_name"
echo "Please enter your name for git: "
read git_email
git config --global user.email "$git_email"