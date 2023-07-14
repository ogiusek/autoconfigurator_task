config_path="config.json"
config_copy_path="config.default.json"

config_edit(){
  while true; do
  local option=$(whiptail --title "edit config" --menu "Choose an option:" 20 60 8 \
  "netplan_main" "$(jq '.netplan.main' $config_path)" \
  "dhcp_main" "$(jq '.dhcp.main' $config_path)" \
  "dhcp_interface" "$(jq '.dhcp.interface' $config_path)" \
  "dns_fowards" "$(jq '.dns.fowards' $config_path)" \
  "dns_zones" "$(jq '.dns.zones' $config_path)" \
  "dns_dir" "$(jq '.dns.dir' $config_path)" \
  "restore" "" \
  "exit" "" \
  3>&1 1>&2 2>&3)
  if [ $option = "restore" ]; then
    cp $config_copy_path $config_path 
    continue
  fi;
  if [ $option = "exit" ]; then
    return
  fi;
  
  local default_value=$(jq ".${option//_/.}" $config_path) && default_value=${default_value//\"/}
  local new_value=$(whiptail --title "$option" --inputbox "Edit path." 10 60 $default_value 3>&1 1>&2 2>&3)
  if [ $new_value ]; then
  jq ".${option//_/.} = \"$new_value\"" $config_path > tmp.json
  mv tmp.json $config_path

  whiptail --title "edit config" --msgbox "edited config" 10 60 2>&1 >/dev/tty
  fi;
  done
}