dns_add_zone(){
  local zone_name=$(whiptail --title "dns add" --inputbox "Enter new zone name:" 10 60 3>&1 1>&2 2>&3)
  # add dns
  whiptail --title "dns add" --msgbox "Added new zone" 10 60 2>&1 >/dev/tty
}

dns_add_redirection(){
  local address=$(whiptail --title "dns add" --inputbox "Enter new redirection address:" 10 60 3>&1 1>&2 2>&3)
  # add dns
  whiptail --title "dns add" --msgbox "Added new redirection" 10 60 2>&1 >/dev/tty
}

dns_add(){
  local action=$(whiptail --title "dns add" --menu "What you want to add:" 20 60 4 \
  "1" "new zone" \
  "2" "redirection" \
  "3" "cancel" \
  3>&1 1>&2 2>&3)

  case $action in
    1)
      dns_add_zone;;
    2)
      dns_add_redirection;;
    *)
      return;;
  esac

  # whiptail --title "dns add" --msgbox "Added dns" 10 60 2>&1 >/dev/tty
}
  # nowa strefa
    # strefa wyszukiwania do przodu (nazwa z sufixem) potem tworzy plik
  # dodanie przekierowania do p
    # adres