<?php
if(!isset($_GET['ip'])) die('no input');

$r = preg_match_all('/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/m', $_GET['ip'], $matches, PREG_SET_ORDER, 0);
if(!isset($matches[0][0])) die('no match');

exec('/usr/sbin/ipset add gta ' . $matches[0][0]);
