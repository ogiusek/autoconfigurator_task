dns_remove_zone(){
  local zone_name=$(whiptail --title "dns remove" --inputbox "Enter zone name:" 10 60 3>&1 1>&2 2>&3)
  # remove dns
  whiptail --title "dns remove" --msgbox "removed new zone" 10 60 2>&1 >/dev/tty
}

dns_remove_redirection(){
  local address=$(whiptail --title "dns remove" --inputbox "Enter redirection address:" 10 60 3>&1 1>&2 2>&3)
  # remove dns
  whiptail --title "dns remove" --msgbox "Added new redirection" 10 60 2>&1 >/dev/tty
}


dns_remove(){
  local action=$(whiptail --title "dns remove" --menu "What you want to remove:" 20 60 4 \
  "1" "new zone" \
  "2" "redirection" \
  "3" "cancel" \
  3>&1 1>&2 2>&3)

  case $action in
    1)
      dns_remove_zone;;
    2)
      dns_remove_redirection;;
    *)
      return;;
  esac
  whiptail --title "dns remove" --msgbox "Removed dns" 10 60 2>&1 >/dev/tty
}