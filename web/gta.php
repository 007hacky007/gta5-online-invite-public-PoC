<?php
define('FIREWALL_IP_ADDR', '');
define('FIREWALL_PORT', '1337');

$ip = $_SERVER['REMOTE_ADDR'];
$re = '/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/m';

preg_match_all($re, $ip, $matches, PREG_SET_ORDER, 0);
if(!isset($matches[0][0])) die('wrong input');
if(file_get_contents("http://" . FIREWALL_IP_ADDR . ":" . FIREWALL_PORT . "/3_gta.php?ip=" .  $matches[0][0]) === false){
	echo 'Failed: server is down?';
	die();
}
echo "Whitelisted";
