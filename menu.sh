#We all know where i got this from
#!/usr/bin/env bash

function choose_from_menu() {
    local prompt="$1" outvar="$2"
    shift 2
    local options=("$@")
    local cur=0
    local count=${#options[@]}

    echo -e "$prompt\n"

    while true; do
        for ((i = 0; i < $count; i++)); do
            if [[ $i -eq $cur ]]; then
                echo -e " \033[38;5;41m>\033[0m\033[38;5;35m${options[i]}\033[0m" # highlight the current option
            else
                echo "  ${options[i]}"
            fi
        done

        # read in pressed key
        IFS= read -rsn1 key
        case $key in
            A) # up arrow
                cur=$((cur - 1))
                [ $cur -lt 0 ] && cur=$((count - 1))
                ;;
            B) # down arrow
                cur=$((cur + 1))
                [ $cur -ge $count ] && cur=0
                ;;
            "") # Enter key
                break
                ;;
        esac

        # clear the screen and move the cursor to the top
        printf "\033c"
        echo -e "$prompt\n"
    done

    eval $outvar="'${options[cur]}'"
}

# explicitly declare selections array makes it safer
declare -a selections=(
"Cargar un nuevo juego de referencias"
"Regenerar referencias"
"Crear un nuevo fichero de almacenamiento"
"Eliminar ficheros de almacenamiento"
"Visualizar los ficheros de log"
"Cambiar idioma de los scripts"
)

# call function with arguments: 
# $1: Prompt text. newline characters are possible
# $2: Name of variable which contains the selected choice
# $3: Pass all selections to the function
choose_from_menu "Please make a choice:" selected_choice "${selections[@]}"

echo "Selected choice: $selected_choice"

