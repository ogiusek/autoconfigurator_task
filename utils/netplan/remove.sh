netplan_remove(){
  # remove 
  # netplan apply

  whiptail --title "netplan remove" --msgbox "Removed interface with name '$netplan_interface_name'" 10 60 2>&1 >/dev/tty
}
