# Ciudad Activa <svg xmlns="http://www.w3.org/2000/svg" width="88" height="20"><linearGradient id="b" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><mask id="a"><rect width="88" height="20" rx="3" fill="#fff"/></mask><g mask="url(#a)"><path fill="#555" d="M0 0h37v20H0z"/><path fill="#4c1" d="M37 0h51v20H37z"/><path fill="url(#b)" d="M0 0h88v20H0z"/></g><g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="11"><text x="18.5" y="15" fill="#010101" fill-opacity=".3">build</text><text x="18.5" y="14">build</text><text x="61.5" y="15" fill="#010101" fill-opacity=".3">passing</text><text x="61.5" y="14">passing</text></g></svg>

* Ruby 2.2.1
* Rails 4.2.4
* MySQL 5




####Requisitos

Minimagick para procesamiento de imágenes cargadas por el usuario
	
	sudo apt-get install minimagick

Time zone support para el uso de la gema groupdate
	
	mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql -p