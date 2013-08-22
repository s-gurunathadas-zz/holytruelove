<?php

//code credit DmS, dmsproject.com

$feedURL = $_POST['rss'];
$feedURL = trim($feedURL);

//verify that this request is okay
if(verifyLink($feedURL)) {
	//if it clears, proceed to read the remote document
	readfile($feedURL);
	}

function verifyLink($requestedURL) {

	//locate the XML file containing the Flash menu data
	//if your XML file has a different name or location, modify $path
	$path = './feedList.xml';
	//start by assuming this request is a hoax
	$authorized = false;
	//use file() to strip the XML tags and populate an array with what remains
	$approvedList = file($path);
	//loop through every item in $approvedList array
	foreach($approvedList as $url) {
		//using the $url enumerator, compare items in $approvedList
		//against the requested URL ($feedURL). If a match is found,
		//it's okay; otherwise don't permit the request
		if(strstr ($url, $requestedURL)) {
			$authorized = true;
			break;	
		}
	}
		return $authorized;
}

?>