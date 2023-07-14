setup_dhcp(){
  # local json_data=$(jq '.dhcp.vav' $config_path)
  while true;do
  local action=$(whiptail --title "dhcp" --menu "Choose an action:" 20 60 4 \
  "1" "add" \
  "2" "edit" \
  "3" "remove" \
  "4" "exit" \
  3>&1 1>&2 2>&3)

  case $action in
    1)
      dhcp_add;;
    2)
      dhcp_edit;;
    3)
      dhcp_remove;;
    *)
      return;;
  esac
  done

	# - dhcpd.conf
	# 	zarezerwj adres (nazwa rezerwacji (bez znaków specjalnych)) jaki adres ma być i czy używa adresu i mac
	# 	dodaj nową podsieć edytuj
	# 	podaj adres ip podsieci (czy ip jest podsieci czy hosta (na końcu zero))
	# 	podaj maskę (pełną)
	# 	chcesz skonfiurować // dodatkowe opcje
	# 		dodaj nowy zakres od do
	# 		brama domyślna
	# 		server dns
	# 		udostępniona domena
	# - isc-dhcp
	# 	ustaw albo zmień kartę sieciową w ramach dhcp (wpisz tylko nazwę interfejsu)
	
	# sudo systemctl restart isc-dhcp-server
}