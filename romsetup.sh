#check if iam root
if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root"
  exit
fi

#remove any open jdk instances
sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*

#installing essential packages
apt-get update
apt-get upgrade
apt-get install openjdk-8-jdk
apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev:i386 zip

#setting up environments
mkdir -p ~/bin
cd ~/bin

#setting up repo
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

echo "export PATH=~/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

#configuring git
read -p "Please enter your name for git: " git_name
read -p "Please enter your email for git: " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"
