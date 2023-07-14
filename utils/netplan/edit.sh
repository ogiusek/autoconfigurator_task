netplan_edit_name(){
  local interface_name=$netplan_interface_name
  local new_interface_name=$(whiptail --title "netplan edit" --inputbox "Enter your new interface name:" 10 60 3>&1 1>&2 2>&3)
  # change name
  whiptail --title "netplan edit" --msgbox "Edited '$netplan_interface_name' name to '$new_interface_name'" 10 60 2>&1 >/dev/tty
}

netplan_edit_interface_type(){
  local interface_name=$netplan_interface_name
  local new_interface_type=$(whiptail --title "netplan edit" --menu "Which interface you want to have:" 20 60 2 \
  "1" "ethernet" \
  "2" "wifi" \
  3>&1 1>&2 2>&3)
  # edit interface type
  whiptail --title "netplan edit" --msgbox "Edited '$netplan_interface_name' interface_type to '$new_interface_type'" 10 60 2>&1 >/dev/tty
}

netplan_edit_wifi_login(){
  local interface_name=$netplan_interface_name
  local new_login=$(whiptail --title "netplan edit" --inputbox "Enter your new wifi login:" 10 60 3>&1 1>&2 2>&3)
  # change login
  whiptail --title "netplan edit" --msgbox "Edited '$netplan_interface_name' wifi login to '$new_login'" 10 60 2>&1 >/dev/tty
}

netplan_edit_wifi_password(){
  local interface_name=$netplan_interface_name
  local new_password=$(whiptail --title "netplan edit" --inputbox "Enter your new wifi login:" 10 60 3>&1 1>&2 2>&3)
  # change password
  whiptail --title "netplan edit" --msgbox "Edited '$netplan_interface_name' wifi password to '$new_password'" 10 60 2>&1 >/dev/tty
}

netplan_edit_ip_type(){
  local interface_name=$netplan_interface_name
  local new_ip_type=$(whiptail --title "netplan edit" --menu "Which ip type you want to have:" 20 60 2 \
  "dynamic" "" \
  "static" "" \
  3>&1 1>&2 2>&3)
  # change ip type
  whiptail --title "netplan edit" --msgbox "Edited '$netplan_interface_name' ip type to to '$new_ip_type'" 10 60 2>&1 >/dev/tty
}

netplan_edit_ip(){
  local interface_name=$netplan_interface_name  
  local new_ip=$(whiptail --title "netplan edit" --inputbox "Enter your new ip with mask:" 10 60 3>&1 1>&2 2>&3)
  # change ip
  whiptail --title "netplan edit" --msgbox "Edited '$netplan_interface_name' ip to '$new_ip'" 10 60 2>&1 >/dev/tty
}

netplan_edit_dns(){
  local interface_name=$netplan_interface_name
  local new_dns=$(whiptail --title "netplan edit" --inputbox "Enter your new dns server:" 10 60 3>&1 1>&2 2>&3)
  # edit dns
  whiptail --title "netplan edit" --msgbox "Edited '$netplan_interface_name' dns server to '$new_dns'" 10 60 2>&1 >/dev/tty
}

netplan_edit_default_gateway(){
  local interface_name=$netplan_interface_name
  local new_default_gateway=$(whiptail --title "netplan edit" --inputbox "Enter your new default gateway:" 10 60 3>&1 1>&2 2>&3)
  # edit default gateway
  whiptail --title "netplan edit" --msgbox "Edited '$netplan_interface_name' default gateway to '$new_default_gateway'" 10 60 2>&1 >/dev/tty
}


netplan_edit(){
  if [ $netplan_interface_type = "wifi" ]; then
    local action=$(whiptail --title "netplan edit" --menu "What you want to edit:" 20 60 9 \
    "1" "name" \
    "2" "interface type" \
    "3" "wifi login" \
    "4" "wifi password" \
    "5" "ip type" \
    "6" "ip" \
    "7" "server dns" \
    "8" "default gateway" \
    "9" "exit" \
    3>&1 1>&2 2>&3)
  else
    local action=$(whiptail --title "netplan edit" --menu "What you want to edit:" 20 60 9 \
    "1" "name" \
    "2" "interface type" \
    "5" "ip type" \
    "6" "ip" \
    "7" "server dns" \
    "8" "default gateway" \
    "9" "exit" \
    3>&1 1>&2 2>&3)
  fi;

  case $action in
    1)
      netplan_edit_name;;
    2)
      netplan_edit_interface_type;;
    3)
      netplan_edit_wifi_login;;
    4)
      netplan_edit_wifi_password;;
    5)
      netplan_edit_ip_type;;
    6)
      netplan_edit_dns;;
    7)
      netplan_edit_dns;;
    8)
      netplan_edit_default_gateway;;
    *)
      return;;
  esac
  # sudo netplan apply
  netplan_edit
}