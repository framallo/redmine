git pull
echo 'Installing gems'
bundle install --deployment --without 'development'
echo 'Restarting server'
touch tmp/restart.txt
