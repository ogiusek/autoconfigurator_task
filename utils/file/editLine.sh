file_edit_line(){
  local file_path=$1
  local word=$2
  local edit_line_to=$3

  local line_number=1
  while IFS= read -r line; do
    if [[ "$line" == *" $word "* ]]; then

      sed -i "${line_number}s|.*|${edit_line_to}|" "$file_path"
      return
    fi

    ((line_number++))
  done < "$file_path"
}