#check if iam root
if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root"
  exit
fi

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install jenkins
echo "\nUse the below password for Jenkins for its initial setup"
echo "\n==============================================\n"
cat /var/lib/jenkins/secrets/initialAdminPassword
echo "\n==============================================\n"
