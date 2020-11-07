#check if iam root
if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root"
  exit
fi

#remove any open jdk instances
sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*

#installing essential packages
apt update
apt upgrade
apt install --assume-yes openjdk-8-jdk
apt --assume-yes install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev

#setting up repo
curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo
sed -i -e 's/env python/env python3/g' /bin/repo
chmod a+x /bin/repo

#configuring git
read -p "Please enter your name for git: " git_name
read -p "Please enter your email for git: " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"
