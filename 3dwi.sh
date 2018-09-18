#!/bin/bash
clear
#Color list
merah='\e[31m'
ijo='\e[1;32m'
kuning='\e[1;33m'
biru='\e[1;34m'
NC='\e[0m'
#intro
printf "${merah} 

YYYYYYYY        YYYYYYYY    EEEEEEEEEEEEEEEEEE      SSSSSSSSSSS
YYYYYYYY        YYYYYYYY    EEEEEEEEEEEEEEEEEE     SSSSSSSSSSSSS
YYYYYYYY        YYYYYYYY    EEEEEEEEEEEEEEEEEE    SSSSSSSSSSSSSSS
YYYYYYYY        YYYYYYYY    EEEEEEEEEEEEEEEEEE    SSSSSSSS    SSS
 YYYYYYYY      YYYYYYYY     EEEEEEEE              SSSSSSSS
  YYYYYYYY    YYYYYYYY      EEEEEEEE              SSSSSSSS
   YYYYYYYY  YYYYYYYY       EEEEEEEEEEEEE          SSSSSSSS
    YYYYYYYYYYYYYYYY        EEEEEEEEEEEEE           SSSSSSSSSS
     YYYYYYYYYYYYYY         EEEEEEEEEEEEE            SSSSSSSSSS
      YYYYYYYYYYYY          EEEEEEEEEEEEE               SSSSSSSSS
       YYYYYYYYYY           EEEEEEEE                     SSSSSSSS
        YYYYYYYY            EEEEEEEE                     SSSSSSSS
        YYYYYYYY            EEEEEEEEEEEEEEEEE     SSS    SSSSSSSS
        YYYYYYYY            EEEEEEEEEEEEEEEEE     SSSSSSSSSSSSSSS
        YYYYYYYY            EEEEEEEEEEEEEEEEE      SSSSSSSSSSSSS
        YYYYYYYY            EEEEEEEEEEEEEEEEE       SSSSSSSSSSS

	 ${ijo}           
	             Awas Ada ${kuning} [ ̋ ☯ ̏ ]${merah}ADI${kuning}[ ̋ ☯ ̏ ] ${ijo} PRIKITIEWWW
	${biru}
		${biru}
                ≛ TUYUL NEWSCAT ≛  Modified by: DWI MIA LESTARI ☜♡☞ 
  ${ijo} Contact: ${kuning} Wa ${merah}                  081282725265
 "

printf "${kuning}	_________________________________________________________________${NC}\n\n"
rm award.tmp aid.txt info.tmp 2> /dev/null
printf "${kuning}[☜☯☞]${NC} Masukan Token Newscat ${merah}DISINI${kuning}: "; read token
printf "${kuning}[☜☯☞]${NC} Periksa Token..."
checktoken=$(curl -s -d "token=$token" 'http://www.newscat.com/api/user/info' -o "info.tmp")
getok=$(cat info.tmp | grep -Po '(?<=message":")[^"]*')
getid=$(cat info.tmp | grep -Po '(?<=id":")[^"]*')
gold=$(cat info.tmp | grep -Po '(?<="gold":)[^,]*')
if [[ $getok == "OK" ]]
		then
			printf "${ijo}Berhasil${NC}\n"
			printf "${ijo}[☜☯☞]${NC} TOKEN : OK\n"
			printf "${ijo}[☜☯☞]${NC} ID PENGGUNA : $getid\n"
			printf "${ijo}[☜☯☞]${NC} BERANGKAS EMAS : $gold\n"
		else
			printf "${merah}Gagal${NC}\n"
			printf "${merah}[☜☯☞]${NC} Token : Error\n"
				exit 0
fi
rm info.tmp 2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah}PERIKSA ID PENGGUNA.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal${NC}\n"
			exit
		else
		printf "${ijo}Terverifikasi${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${merah}MULAI NUYUL..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2> /dev/null
printf "${kuning}[☜☯☞]${NC} ${merah} PERIKSA PENGGUNA BARU.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Gagal-_-${NC}\n"
			exit
		else
		printf "${ijo}Behasil^_^${NC}\n"
	fi
printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$token&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Emas : $getgold] [${ijo}Berhasil^_^${NC}]\n"
	else
	printf "${merah}[☜☯☞]${NC} [ID : $aid ] [Nuyul : $getreward] [Nuyul : 0] [${merah}Gagal-_-${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 3
done
2>  /dev/null
printf "${kuning}[☜☯☞]${NC} Masukan Nama ${merah}DISINI${kuning}: "; read name
printf "${kuning}[☜☯☞]${NC} Periksa Nama..."
checktoken=$(curl -s -d "token=$token" 'http://www.newscat.com/api/user/info' -o "info.tmp")
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Tidak Kenal${NC}\n"
			exit
		else
		printf "${ijo}Tidak Kenal${NC}\n"
	fi

printf "${kuning}[☜☯☞]${NC} ${ijo}MULAI NUYUL LAGI..\n"
printf "Rehat Dulu Bossqu"

