# Project Zomboid Multiplayer Sync

Have you ever been playing on a Zomboid server only for the IP address to change & you lose all your map data? Well then this is the tool for you!

This tool has been designed to help you migrate your player data over to work with the new server.

Not only does it migrate you player data, it also updates your server list with the latest IP address.

# Installation

1. Install Git for Windows https://git-scm.com/downloads/win (If you'e on Mac or Linux skip this step)
2. Download `main.sh` & save it to somewhere you're happy with
3. Open up Terminal & type `./main.sh LATEST_SERVER_IP` for example `./main.sh 13.220.54.36` then press enter

# Details

The script will save the current IP address that you connect to into a file called `old_ip_address.txt`.
When you attempt to launch the game again & the server has a new IP address it will look at your previous IP from `old_ip_address.txt` & rename your saved data using this old IP with the new IP.
It will also modify your ServerListSteam.txt file which has all of your favourite servers in them.
This tool will help keep you in sync if/when the server IP address changes.

# Configuration

If you need to override the old IP address that is saved in `old_ip_address.txt` feel free to modify that file.

Alternatively you can run the script like `./main.sh <NEW_IP> <OLD_IP>` for example `./main.sh 13.220.54.36 13.15.252.4`.

Your old data when connecting to the server via the IP **13.15.252.4** will be updated to work with **13.220.54.36**.
