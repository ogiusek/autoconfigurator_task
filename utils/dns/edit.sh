dns_edit_zone_name(){
  local new_zone_name=$(whiptail --title "dns edit" --inputbox "Enter new zone name:" 10 60 3>&1 1>&2 2>&3)

  # edit

  whiptail --title "dns edit" --msgbox "Edited zone name" 10 60 2>&1 >/dev/tty
}

dns_edit_relations(){
  while true; do
    local relation=$(whiptail --title "dns edit" --menu "Which relation you want to edit:" 20 60 4 \
      "1" "relation one" \
      "2" "relation two" \
      "3" "exit" \
    3>&1 1>&2 2>&3)
    if [ "$relation" = "3" ]; then return;fi;

    local relation_1=""
    local relation_2=""
    local relation_3=""
    local relation_4=""
    while true; do
      local relation_part=$(whiptail --title "dns edit" --menu "Which part you want to edit:" 20 60 5 \
        "1" "$relation_1" \
        "2" "$relation_2" \
        "3" "$relation_3" \
        "4" "$relation_4" \
        "5" "confirm" \
      3>&1 1>&2 2>&3)
      case $relation_part in
        1)
          relation_1=$(whiptail --title "dns edit" --inputbox "Enter new value:" 10 60 3>&1 1>&2 2>&3)
          ;;
        2)
          relation_2=$(whiptail --title "dns edit" --inputbox "Enter new value:" 10 60 3>&1 1>&2 2>&3)
          ;;
        3)
          relation_3=$(whiptail --title "dns edit" --inputbox "Enter new value:" 10 60 3>&1 1>&2 2>&3)
          ;;
        4)
          relation_4=$(whiptail --title "dns edit" --inputbox "Enter new value:" 10 60 3>&1 1>&2 2>&3)
          ;;
        *)
          break
          ;;
      esac
    done;

    # file(relation) = relation_1+relation_2+relation_3+relation4
    # edit

    whiptail --title "dns edit" --msgbox "Edited zone relations" 10 60 2>&1 >/dev/tty
  done;
}

dns_edit(){
  # nazwę strefy
  dns_edit_zone_name=$(whiptail --title "dns edit" --inputbox "Enter zone name to edit:" 10 60 3>&1 1>&2 2>&3)

  while true; do
    local action=$(whiptail --title "dns edit" --menu "What you want to edit:" 20 60 4 \
    "1" "zone name" \
    "2" "redirection" \
    "3" "exit" \
    3>&1 1>&2 2>&3)

    case $action in
      1)
        dns_edit_zone_name;;
      2)
        dns_edit_relations;;
      *)
        return;;
    esac
  # zmiana nazwy strefy
  # powiązania (jedna linia 4 columny)

  done

}
