#!/bin/bash

MENU_ITEMS='menu("sinks") {'

get_all_sinks() {
  pactl list short sinks | cut -f 2
}

build_menu() {
    SINKS=$(get_all_sinks);

    readarray -t SINKS_ARR <<<"$SINKS";

    for OUTPUT in "${SINKS_ARR[@]}"
    do
      MENU_ITEMS+="\n     item(\"$OUTPUT\", ";
      MENU_ITEMS+="Exec \"pactl set-default-sink $OUTPUT\");";
    done

    MENU_ITEMS+="\n}";

    echo -e "$MENU_ITEMS"

    # or can pass value to EOF ex: cat <<EOF [formated_value] EOF
}

build_menu
