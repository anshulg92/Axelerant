#!/bin/bash

read -p "Please provide username" username
read -p "Please enter new_user or access_revoke" access
read -p "Please share ssh keys" keys

serverlist=`cat ./serverlist`

if [[ $access == new_user ]]
then
  for $server in $serverlist
  do
     ssh $server "useradd -m "$username" -s /bin/bash && echo "$keys" >> /home/$username/.ssh/authorized_keys"
  done
elif [[ $access == access_revoke ]]
then
  for $server in $serverlist
  do
     ssh $server "userdel -r "$username""
  done
else
   echo "Please enter new_user or access_revoke only"
fi
