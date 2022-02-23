<?php

define('CUSTOMERNR', $_ENV["CUSTOMERNR"]);
define('APIPASSWORD', $_ENV["APIPASSWORD"]);
define('APIKEY', $_ENV["APIKEY"]);
define('DOMAINLIST', $_ENV["DOMAINLIST"]);

// If set to true, the script will check for your public IPv6 address too and add it as an AAAA-Record / change an existing AAAA-Record for the host.
// Activate this only if you have IPv6 connectivity, or you *WILL* get errors.
define('USE_IPV6', false);


// If set to true, this will change TTL to 300 seconds on every run if necessary.
define('CHANGE_TTL', true);


// Use netcup DNS REST-API.
define('APIURL', 'https://ccp.netcup.net/run/webservice/servers/endpoint.php?JSON');
