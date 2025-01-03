#!/bin/sh

# Functions 
# -> options
debug() {
  # Display basic colors
  echo -e "\nBasic Colors:"
  for color in {30..37}; do
    echo -en "\e[${color}m   \e[0m "  
  done
  echo
  for color in {30..37}; do
    echo -en "\e[${color}m Color ${color}\e[0m  "
  done

  # Display bright colors
  echo -e "\n\nBright Colors:"
  for color in {90..97}; do
    echo -en "\e[${color}m   \e[0m "  
  done
  echo
  for color in {90..97}; do
    echo -en "\e[${color}m Bright ${color}\e[0m  "  
  done

  # Display background colors
  echo -e "\n\nBackground Colors:\n"
  for color in {40..47}; do
    echo -en "\e[${color}m   \e[0m "  
  done
  echo -e "\n\nText + Background Colors\n"
  for color in {40..47}; do
    echo -en "\e[${color}m BG ${color}\e[0m  "  
  done

  # Display text styles
  echo -e "\n\nText Styles:"
  echo -e "\e[1mBold Text\e[0m   \e[4mUnderlined Text\e[0m   \e[7mReversed Text\e[0m"
} 

show_help() {
  echo "Usage: $0 [-d|--debug] [-h|--help]"
  echo "  -a, --all    Show every patterns"
  echo "  -h, --help   Show this help message"
  echo "  -d, --debug  Display debug information"
}

show_all() {
  echo "All pattern :"
  echo "  - dots"
  echo "  - squares"
  echo "  - cards"
  echo "  - flowers"
  echo "  - palette"
}

# -> arguments

dots() {
  echo -en "\n   "
  for color in {31..37}; do
      echo -en "\e[${color}m●\e[0m   "  # Display a block of background color
  done
  echo -en "\n"
}

squares() {
  echo -en "\n"
  for color in {41..47}; do
      echo -en "\e[${color}m  \e[0m  "  # Display a block of background color
  done
  echo -en "\n"
}

cards() {
  echo -en "\n"
  for i in {1..7}; do
    for color in {40..47}; do
        echo -en "\e[${color}m          \e[0m  "  # Display a block of background color
    done
  echo -en "\n"
  done
}

flowers() {
  echo -en "\n"
  # flowers pattern :
  flower1=(" _,-._  " "/ \_/ \ " ">-(_)-< " "\_/ \_/ " "  \`-'   ")
  flower2=("    _ _  __" "   ( | )/_/" "__( >✱< )  " "\ \( | )   " " ¯¯ ¯ ¯    ")

  max_height=${#flower1[@]}

  for ((i=0; i<max_height; i++)); do
    echo -en "\e[1;91m${flower1[$i]}\e[0m  "
    echo -en "\e[1;92m${flower1[$i]}\e[0m  "
    echo -en "\e[1;93m${flower2[$i]}\e[0m  "
    echo -en "\e[1;94m${flower1[$i]}\e[0m  "
    echo -en "\e[1;95m${flower1[$i]}\e[0m  "
    echo -en "\e[1;96m${flower2[$i]}\e[0m  "
    echo -e "\e[1;97m${flower1[$i]}\e[0m"
  done
}

palette() {
  echo -en "\n"

  block=("█████" "█████" "█████" "█████" "█████")

  max_height=${#block[@]}

  for ((i=0; i<max_height; i++)); do
    echo -en "\e[1;91m${block[$i]}\e[0m  "
    echo -en "\e[1;92m${block[$i]}\e[0m  "
    echo -en "\e[1;93m${block[$i]}\e[0m  "
    echo -en "\e[1;94m${block[$i]}\e[0m  "
    echo -en "\e[1;95m${block[$i]}\e[0m  "
    echo -en "\e[1;96m${block[$i]}\e[0m  "
    echo -e "\e[1;97m${block[$i]}\e[0m"
  done
}

# manages options

# Short options only
while getopts ":dha" opt; do
  case ${opt} in
    d )
      debug
      ;;
    h )
      show_help
      exit 0
      ;;
    a )
      show_all
      exit 0
      ;;
    \? )
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Shift past the options processed by getopts
shift $((OPTIND -1))

# Handle if nothing
if [ "$1" = "" ]; then
  show_help
  exit 1
fi
  
# Handle long options and else
for arg in "$@"; do
  case "$arg" in
  --debug)
    debug
    ;;
  --help)
    show_help
    exit 0
    ;;
  --all)
    show_all
    exit 0
    ;;
  --*)
    echo "Invalid option: $arg" >&2
    exit 1
    ;;
  dots)
    dots
    exit 1
    ;;
  squares)
    squares
    exit 0
    ;;
  cards)
    cards
    exit 0
    ;;
  flowers)
    flowers
    exit 0
    ;;
  palette)
    palette
    exit 0
    ;;
  *)
    echo "Unknown command: $arg" >&2
    echo "  do -h or --help to show help"
    echo "  do -a or --all to show all patterns"
    exit 1
    ;;
  esac
done
