dhcp_add(){
  dhcp_add_subnet=$(whiptail --title "dhcp add" --inputbox "Enter subnet:" 10 60 3>&1 1>&2 2>&3)
  dhcp_add_mask=$(whiptail --title "dhcp add" --inputbox "Enter mask:" 10 60 3>&1 1>&2 2>&3)
  dhcp_add_address=$(whiptail --title "dhcp add" --inputbox "Enter address:" 10 60 3>&1 1>&2 2>&3)
  dhcp_add_mac=$(whiptail --title "dhcp add" --inputbox "Enter mac:" 10 60 3>&1 1>&2 2>&3)
  dhcp_add_name=$(whiptail --title "dhcp add" --inputbox "Enter name:" 10 60 3>&1 1>&2 2>&3)

  # add dhcp

  # adres podsieci i maskę
  # nowa rezerwacja adresu (adres i adres mac i nazwę)
  whiptail --title "dhcp add" --msgbox "Added dhcp" 10 60 2>&1 >/dev/tty
}
