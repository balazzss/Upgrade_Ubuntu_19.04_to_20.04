# Upgrade_Ubuntu_19.04_to_20.04

### If curl is already installed follow the steps: 
Run the upgrade programm

      sudo curl -l https://raw.githubusercontent.com/balazzss/Upgrade_Ubuntu_19.04_to_20.04/main/install.sh | sudo -u $USER bash
      
### If curl is not installed: 
First download the programm: 

      sudo wget https://raw.githubusercontent.com/balazzss/Upgrade_Ubuntu_19.04_to_20.04/main/install.sh

Make it executable
      
      sudo chmod +x install.sh
      sudo chown $USER:$USER install.sh

Run the installation programm without sudo!!
      
      ./install.sh
