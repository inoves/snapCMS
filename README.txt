Install in 5 Steps:
1 - Copy this CMS files to folder your choice.
2 - Set DocumentRoot from your Apache Vhost config to path this 'webroot' folder
3 - Entry corrected data in ./config/config.php and ./config/databases.php
4.1 - Set permission 655 for folder ./webroot/photos/ and ./webroot/manufactures
4.2 - Set recursive permission 655 for folder ./cache(chmod -R 655 ./cache)
5 - Install script mysql 'install_db.sql' in your mysql server

----------------
For Designer

Make your templates of menus and copy this files to views/types folder, later set your config file(./config/config.php)
with this new templates locations and your reference name(backoffice) in the static variables '$types_of_menu'
Equal procedure to make templates for pages, but set variable '$templates_names' in config

-----------------

Next updates:
Próximas actualizações:
	- Customer controller
	- Instalation system (Sistema de instalação)
	
If you like help this project, please send me email.
Se voce quiser ajudar este projecto, entre em contacto.



Power by
http://inov.es