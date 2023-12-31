#!/bin/bash
trap "tput reset; tput cnorm; exit" 2
clear
tput civis
lin=2
col=$(($(tput cols) / 2))
c=$((col-1))
est=$((c-2))
color=0
tput setaf 2; tput bold

# Tree
for ((i=1; i<22; i+=2))
{
    tput cup $lin $col
    for ((j=1; j<=i; j++))
    {
        echo -n \*
    }
    let lin++
    let col--
}

tput sgr0; tput setaf 3

# Trunk
for ((i=1; i<=3; i++))
{
    tput cup $((lin++)) $c
    echo 'СИТ'
}
tput setaf 2; tput bold
tput cup $lin $((c - 8)); echo  Поздравляю с Новым 2024 годом!
tput setaf 6; tput bold
tput cup $((lin + 1)) $((c - 31)); echo Пусть в Новом году у вас будет много хороших смен и меньше багов,
tput cup $((lin + 2)) $((c - 31)); echo большой аптайм критичных систем, недремучие юзеры, новые мощные ПК,
tput cup $((lin + 3)) $((c - 31)); echo вас обойдёт DDoS, а ваши бэкапы всегда в сохранности и обновлены на SSD!
tput cup $((lin + 4)) $((c - 31)); echo Cпокойный Zabbix , активный пинг, доступ ко всем нужным ресурсам - 
tput cup $((lin + 5)) $((c - 31)); echo это ваше будущее IT-2024, повелители SVOVIP и короли поддержки юзеров!
let c++
k=1

# Lights and decorations
while true; do
    for ((i=1; i<=35; i++)) {
        # Turn off the lights
        [ $k -gt 1 ] && {
            tput setaf 2; tput bold
            tput cup ${line[$[k-1]$i]} ${column[$[k-1]$i]}; echo \*
            unset line[$[k-1]$i]; unset column[$[k-1]$i]  # Array cleanup
        }

        li=$((RANDOM % 10 + 3))
        start=$((c-li+2))
        co=$((RANDOM % (li-2) * 2 + 1 + start))
        tput setaf $color; tput bold   # Switch colors
        tput cup $li $co
        echo o
        line[$k$i]=$li
        column[$k$i]=$co
        color=$(((color+1)%8))
    }
    k=$((k % 2 + 1))
done
