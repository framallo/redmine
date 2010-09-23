mysqldump -u tangosource -p tangosource --skip-extended-insert tangosource_redmine > tangosource_redemine.sql
git init
git add tangosource_redmine.sql
git commit -m 'Updating database'

