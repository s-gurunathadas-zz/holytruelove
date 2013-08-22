import com.xfactorstudio.xml.xpath.*;
import mx.utils.Delegate;
import mx.controls.TextArea;

/*
This is a class to parse and format data from rss feeds.
Due to security limits, Flass can not import data from remote domains,
so this class expects there to be a PHP proxy script located at the same level
of the same directory that the .swf file is in. This proxy file is named
"rssProxy.php", and expects to have a complete URL passed to it via the GET protocol
with the query string "?rss=[url]".
*/

class ProcessRssX {

//declare private properties
private var titles:Array;
private var links:Array;
private var descriptions:Array;
private var _xml:XML;
private var proxyPath:String;
private var senderObj:LoadVars;
private var loaderID:Number;

//declare public properties
public var targetClip:MovieClip;
public var textTarget:TextArea;

//constructor
function ProcessRssX (_mc:MovieClip, _ta:TextArea, _proxy) {
	targetClip = _mc;
	textTarget = _ta;
	proxyPath = _proxy;
	_xml = new XML();
	_xml.ignoreWhite = true;	
	_xml.onLoad = Delegate.create(this, processFeed);
}

//loadFeed method accepts one argument: the URL of the feed to load
public function loadFeed(url:String):Void {
	//terminate any running intervals
	clearInterval(loaderID);
	//create new LoadVars Object
	senderObj = new LoadVars();
	//declare a propertie of this Object and assign it the URL value
	senderObj.rss = url;
	/*LoadVars.sendAndLoad method will conveniently accept an XML object as its target.
	We send a string (url) to the script using GET and get back XML data.*/
	senderObj.sendAndLoad(proxyPath, _xml, "POST");
	//use setInterval to monitor load progressevery 25 milliseconds
	this.loaderID = setInterval(this, "loadingFeedback", 25, _xml);
}

private function processFeed():Void {
	//terminate any running interval
	clearInterval(loaderID);
	/*
	Populate arrays. This relies on methods of the XPath class. See the tutorial
	at http://www.w3schools.com/xpath/ for tips on XPath syntax. See
	http://www.xfactorstudio.com/ for the latest versions of the XPath for ActionScript classes.
	Note that rss feeds can contain information other than the three I use. Feel free to
	explore this on your own.
	*/
	titles = XPath.selectNodes(_xml, "//item/title/text()");
	links = XPath.selectNodes(_xml, "//item/link/text()");
	descriptions = XPath.selectNodes(_xml, "//item/description/text()");
	//once arrrays have been filled, format and display the information
	displayFeed();
	
	//clean up by emptying arrays
	titles = [];
	links = [];
	descriptions = [];
}

//extract data from arrays and send to the TextArea component in html form
private function displayFeed():Void {
	//reset scroll position of TextArea component
	textTarget.vPosition = 0;
	textTarget.text = "<p>"+Math.floor(_xml.getBytesTotal()/1024) + " kb total</p>";
	var itemNum:Number = titles.length;
	for (var i:Number = 0; i<itemNum; i++) {
		textTarget.text += "<headline><a href='"+links[i]+
						"' target='_blank'>"+titles[i]+"</a></headline><p>"+
						descriptions[i]+"</p><br>";
	}
}

//the progress monitor called by setInterval
private function loadingFeedback(xmlObj:XML):Void {
	if (xmlObj.getBytesLoaded() > 0){
	textTarget.text = "<p>Loaded: "+Math.floor(xmlObj.getBytesLoaded()/1024)+" kilobytes</p>";
	} else {
	textTarget.text = "<p>Requesting Data...</p>";
	}
}


}