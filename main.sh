cwd=$(pwd)
steam="C:\Program Files (x86)\Steam\steam.exe"

base_path="$HOME/Zomboid/Saves/Multiplayer"

# Check for old ip address file
if [ -e old_ip_address.txt ]; then
  echo "Found old IP address"
else
  echo "Using original old IP address"
  echo "3.106.76.135" >old_ip_address.txt
fi

old_ip_address=$(cat "$cwd"/old_ip_address.txt)
# TODO: Fetch this from an API

if [ -z "$1" ]; then
  new_ip_address=$(curl https://raw.githubusercontent.com/martinwheeler/project-zomboid/refs/heads/main/current_ip.txt)
else
  new_ip_address=$1
fi

echo "Old IP: $old_ip_address"
echo "New IP: $new_ip_address"

old_folders=$(ls $base_path | grep $old_ip_address)

# There may be multiple characters so move them all
for old_folder in $old_folders; do
  new_folder=$(echo $old_folder | sed -e "s/$old_ip_address/$new_ip_address/")
  mv -f "${base_path}/${old_folder}" "${base_path}/${new_folder}"
done

echo "Finished migrating player data"

echo $new_ip_address >old_ip_address.txt

echo "Saving IP address for next time"

echo "Launching PZ"

"$steam" steam://rungameid/108600
