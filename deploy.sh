echo 'Installing gems'
bundle install --deployment
echo 'Restarting server'
touch tmp/restart.txt
