#!/bin/zsh
n=0
clip=$(xsel -o)
if [[ -n $(echo $clip | grep "^[a-A]") ]] ; then
	clip=$(wget -U "Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=t&text=$(echo $clip | sed "s/[\"'<>]//g; s/&/%26/g")&sl=auto&tl=ru" | sed 's/\[\[\[\"//' | cut -d \" -f 1)
	twmnc -c "$clip" -t "en->ru"
	n=1
elif [[ -n $(echo $clip | grep "^[а-А]") ]] ; then
	clip=$(wget -U "Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=t&text=$(echo $clip | sed "s/[\"'<>]//g; s/&/%26/g")&sl=auto&tl=en" | sed 's/\[\[\[\"//' | cut -d \" -f 1)
	twmnc -c $clip -t "ru->en"
	n=1
elif [[ -n $(echo $clip | grep "^\#") ]] ; then
	clip=$(echo $clip | sed 's/\#//g')
	twmnc --bg "#$clip" -t "#$clip"
	n=1
fi
if [[ $n -eq 0 ]] ; then
	clip=$(wget -U "Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=t&text=$(echo $clip | sed "s/[\"'<>]//g; s/&/%26/g")&sl=auto&tl=ru" | sed 's/\[\[\[\"//' | cut -d \" -f 1)
	twmnc -c "$clip" -t "*->ru"
fi

#hello
#привет
#001199
#hi, i& bob!=