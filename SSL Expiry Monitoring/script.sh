while read website1 ; do
certificate_file=$(mktemp)
ssl_date=$(echo -n | openssl s_client -servername "$website1" -connect "$website1":443 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > $certificate_file)
ssl_date_expiry=$(openssl x509 -in $certificate_file -enddate -noout | sed "s/.*=\(.*\)/\1/")
ssl_date_formatted=$(date -d "${ssl_date_expiry}" +%s)
current_date=$(date -d now +%s)
expiry_current_difference=$(( (ssl_date_formatted - current_date) / 86400 ))
echo "$website1 will expire in $expiry_current_difference days"
rm "$certificate_file"
name_of_sender="Give the name of sender"
email_of_sender="xyz@outlook.com"
name_of_reciever="Give the name of reciever"
email_of_reciever="xyz@outlook.com"
email_of_reciever2="abc@outlook.com"
a=${expiry_current_difference}
#if [ $a -eq 40 ] || [ $a -eq 38 ] || [ $a -eq 35 ] || [ $a -eq 30 ] || [ $a -eq 27 ] || [ $a -eq 24 ] || [ $a -eq 20 ] || [ $a -eq 18 ] || [ $a -eq 15 ] || [ $a -eq 10 ] || [ $a -eq 9 ] || [ $a -eq 8 ] || [ $a -eq 7 ] || [ $a -eq 6 ] || [ $a -eq 5 ] || [ $a -eq 4 ] || [ $a -eq 3 ] || [ $a -eq 2 ] || [ $a -eq 1 ]
#then

if  [ $a -eq 20 ] || [ $a -eq 15 ] || [ $a -eq 10 ] || [ $a -eq 7 ] || [ $a -eq 5 ] || [ $a -eq 3 ] || [ $a -eq 2 ] || [ $a -eq 1 ]
then

        curl --request POST \
  --url https://api.sendinblue.com/v3/smtp/email \
  --header 'accept: application/json' \
  --header 'api-key:**********************************************************************' #SendInBlueAPI \
  --header 'content-type: application/json' \
  --data '{
   "sender":{
      "name":"'$name_of_sender'",
      "email":"'$email_of_sender'"
   },
   "to":[
      {
         "email":"'$email_of_reciever'",
         "name":"'$name_of_reciever'"
      },
      {
          "email":"'$email_of_reciever2'",
          "name":"'$name_of_reciever'"
      }
   ],
   "subject":"SSL certificate for '$website1' will expire in '$a' days.",
   "htmlContent":"<html><head></head><body><p>Hello Team,</p>SSL certificate for '$website1' will expire in '$a' days.</p></body></html>"
}'
   else
echo "Not Working"
fi
done < websites.txt  # Assuming you have a file named 'websites.txt' with one website URL per line
