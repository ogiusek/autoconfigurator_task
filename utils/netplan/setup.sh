setup_netplan(){
  # local json_data=$(jq '.dhcp.main' $config_path) # returns path

  netplan_interface_name=$(whiptail --title "netplan" --inputbox "Enter interface name which you want to edit:" 10 60 3>&1 1>&2 2>&3)
  if ! [[ $netplan_interface_name =~ ^[A-Za-z0-9]{3,15}$ ]]; then
    whiptail --title "netplan" --msgbox "Not allowed or wrong length netplan name" 10 60 2>&1 >/dev/tty
    setup_netplan
    return
  fi;
  netplan_interface_type=$(whiptail --title "netplan" --menu "Which interface you want to have:" 20 60 2 \
  "1" "ethernet" \
  "2" "wifi" \
  3>&1 1>&2 2>&3)

  while true;do
  local action=$(whiptail --title "netplan" --menu "Choose an action:" 20 60 4 \
  "1" "add" \
  "2" "edit" \
  "3" "remove" \
  "4" "exit" \
  3>&1 1>&2 2>&3)

  case $action in
    1)
      netplan_add;;
    2)
      netplan_edit;;
    3)
      netplan_remove;;
    *)
      return;;
  esac
  done
}

# dodaj/usuń/edytuj
# typ interfejsu
# 