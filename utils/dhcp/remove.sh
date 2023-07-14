dhcp_remove(){
  dhcp_remove_subnet=$(whiptail --title "dhcp remove" --inputbox "Enter subnet:" 10 60 3>&1 1>&2 2>&3)
  # remove dhcp
  
  # adres podsieci 
  whiptail --title "dhcp remove" --msgbox "Removed dhcp" 10 60 2>&1 >/dev/tty
}
