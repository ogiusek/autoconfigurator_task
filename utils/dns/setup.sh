setup_dns(){
	# dns_interface_name=$(whiptail --title "dns" --inputbox "Enter interface name which you want to edit:" 10 60 3>&1 1>&2 2>&3)
  # if ![[ $dns_interface_name =~ ^[A-Za-z0-9]{3,15}$ ]]; then
  #   whiptail --title "dns" --msgbox "Not allowed or wrong length dns name" 10 60 2>&1 >/dev/tty
  #   setup_dns
  #   return
  # fi;

  while true;do
  local action=$(whiptail --title "dns" --menu "Choose an action:" 20 60 4 \
  "1" "add" \
  "2" "edit" \
  "3" "remove" \
  "4" "exit" \
  3>&1 1>&2 2>&3)

  case $action in
    1)
      dns_add;;
    2)
      dns_edit;;
    3)
      dns_remove;;
    *)
      return;;
  esac
  done

  # 	- named.conf.options
	# 	dodaj adres zewnętrznego servera dns
	# 	usuń adres servera zewnętrznego dns
	# - named.conf.local
	# 	zadeklaruj nową strefę w przód
	# 	usuń strefę 
	# 		jeśli tworzynmy 
	# 		nazwa domeny ?(czy podał sufix)
	# 		wskazanie pliku dla konfiguracji strefy (kopia db.local)
	# - db.local
	# 	edytuj ustawienia strefy
	# 	nadaj powiązania (dodaj-usuń regułę powiązania dodaj pola na wzór tabelki (4 informację))

	# sudo systemctl restart bind9
}