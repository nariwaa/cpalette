
# #Functions 
# options
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
  echo -e "\n\nBackground Colors:"
  for color in {40..47}; do
    echo -en "\e[${color}m   \e[0m "  
  done
  echo -e "\n\nText + Background Colors"
  for color in {40..47}; do
    echo -en "\e[${color}m BG ${color}\e[0m  "  
  done

  # Display text styles
  echo -e "\n\nText Styles:"
  echo -e "\e[1mBold Text\e[0m   \e[4mUnderlined Text\e[0m   \e[7mReversed Text\e[0m"
} 

show_help() {
    echo "Usage: $0 [-d|--debug] [-h|--help]"
    echo "  -d, --debug  Display debug information"
    echo "  -h, --help   Show this help message"
}

# arguments

dots() {
  echo -en "\n   "
  for color in {31..37}; do
      echo -en "\e[${color}m●\e[0m   "  # Display a block of background color
  done
  echo -en "\n\n"
}

squares() {
  echo -en "\n"
  for color in {41..47}; do
      echo -en "\e[${color}m  \e[0m  "  # Display a block of background color
  done
  echo -en "\n"
}

# manages options

# Short options only
while getopts ":dh" opt; do
  case ${opt} in
    d )
        debug
        ;;
    h )
        show_help
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
        exit 1
        ;;
  esac
done
