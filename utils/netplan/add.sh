netplan_add(){
  # add interface
  whiptail --title "netplan add" --msgbox "Added interface with name '$netplan_interface_name'" 10 60 2>&1 >/dev/tty
}