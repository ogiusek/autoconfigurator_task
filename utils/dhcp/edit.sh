dhcp_edit_subnet(){
  local new_subnet=$(whiptail --title "dhcp edit" --inputbox "Enter new subnet:" 10 60 3>&1 1>&2 2>&3)

  # edit

  whiptail --title "dhcp edit" --msgbox "Edited subnet" 10 60 2>&1 >/dev/tty
}

dhcp_edit_mask(){
  local new_mask=$(whiptail --title "dhcp edit" --inputbox "Enter new mask:" 10 60 3>&1 1>&2 2>&3)

  # edit

  whiptail --title "dhcp edit" --msgbox "Edited mask" 10 60 2>&1 >/dev/tty
}

dhcp_edit_scope(){
  local new_scope_from=$(whiptail --title "dhcp edit" --inputbox "Enter new scope from:" 10 60 3>&1 1>&2 2>&3)
  local new_scope_to=$(whiptail --title "dhcp edit" --inputbox "Enter new scope to:" 10 60 3>&1 1>&2 2>&3)

  # edit

  whiptail --title "dhcp edit" --msgbox "Edited scope" 10 60 2>&1 >/dev/tty
}

dhcp_edit_server_dns(){
  local new_server_dns=$(whiptail --title "dhcp edit" --inputbox "Enter new dns server:" 10 60 3>&1 1>&2 2>&3)

  # edit

  whiptail --title "dhcp edit" --msgbox "Edited server dns" 10 60 2>&1 >/dev/tty
}

dhcp_edit_shared_domain(){
  local new_shared_domain=$(whiptail --title "dhcp edit" --inputbox "Enter new shared domain:" 10 60 3>&1 1>&2 2>&3)

  # edit

  whiptail --title "dhcp edit" --msgbox "Edited shared domain" 10 60 2>&1 >/dev/tty
}

dhcp_edit(){
  dhcp_edit_subnet_name=$(whiptail --title "dhcp edit" --inputbox "Enter subnet which you are editing:" 10 60 3>&1 1>&2 2>&3)

  while true; do
    local action=$(whiptail --title "dhcp edit" --menu "What you want to edit:" 20 60 6 \
    "1" "Edit subnet address" \
    "2" "Edit mask" \
    "3" "Edit scope" \
    "4" "Edit server dns" \
    "5" "Edit shared domain" \
    "6" "Exit" \
    3>&1 1>&2 2>&3)

    case $action in
      1)
        dhcp_edit_subnet;;
      2)
        dhcp_edit_mask;;
      3)
        dhcp_edit_scope;;
      4)
        dhcp_edit_server_dns;;
      5)
        dhcp_edit_shared_domain;;
      *)
        return;;
    esac
  done
}