class HTTPConnection
{
    private var verb:String = "POST";
    private var body:String = "";
    private var url:String = "";
    
    var contentType:String;
    var sendAndLoad:Function = LoadVars.prototype.sendAndLoad;
	var load:Function = LoadVars.prototype.load;

	// note: many headers can't be added. http://livedocs.macromedia.com/flash/8/main/wwhelp/wwhimpl/common/html/wwhelp.htm?context=LiveDocs_Parts&file=00002324.html
    var addRequestHeader:Function = LoadVars.prototype.addRequestHeader;
	var onData:Function; // Hook into this Function(string) to receive the response

    function HTTPConnection(_url:String )
    {
		url  = _url;
    }

	function Log(_text:String) {
		
	}

	function setVerb(_verb:String) {
		if (_verb != null) {
			verb = _verb;
		}
	}
	
	function setBody(_body:String) {
		if (_body != null) {
			body = _body;
		}
	}

	function setContentType(_contentType:String) {
		Log("setContentType: " + _contentType);
		if (_contentType != null) {
			contentType = _contentType;
		}
	}

    function toString():String
    {
		return body;
    }

    function send()
    {
		Log("HttpConnection send (verb=" + verb + ")");
		Log("HttpConnection send (body length=" + body.length + ")");
		
		// note: this appears in LiveHTTPHeaders only when doing a POST. Does that mean it's not properly set when doing a GET?
		//addRequestHeader("X-Hello-World", "Hello world");
		//addRequestHeader(["X-Hello-World", "Hello world"]);
		
		// note: if we did a sendAndLoad on a GET, the Flash API would add a question mark '?' at the end of the querystring :(
		if (verb == "GET") {
			load(url);
		} else {
			sendAndLoad(url, this, verb);
		}
    }
}
