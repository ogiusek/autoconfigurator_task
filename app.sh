#!/bin/bash
end_app() { exit 0; }
trap end_app SIGINT
source utils/source.sh

# echo "file with fun text" > "$file_path"
# local file_path="config.json"
# local file_content=$(<$file_path)
# local json_data=$(jq '.val.vav' $file_path)

run_app(){
  local option=$(whiptail --title "Autoconfigurator" --menu "Choose an option:" 20 60 7 \
  "1" "Setup netplan" \
  "2" "Setup dhcp" \
  "3" "Setup dns" \
  "4" "Edit config" \
  "5" "exit " \
  3>&1 1>&2 2>&3)

  # Handle the selected option
  last_used_option=$option
  case $option in
    1)
      setup_netplan;;
    2)
      setup_dhcp;;
    3)
      setup_dns;;
    4)
      config_edit;;
    *)
      end_app;;
  esac
}

# Main function
main() {
  while true; do
    run_app
  done
}

# Run the main function
main