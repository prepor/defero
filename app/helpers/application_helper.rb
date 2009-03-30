# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def orbited_javascript
    [    
    "<script src=\"http://#{ConfigOrbited[:host]}:#{ConfigOrbited[:port]}/static/Orbited.js\"></script>",
    '<script>',
    "  document.domain = document.domain",
    "  Orbited.settings.port = #{ConfigOrbited[:port]};",
    "  Orbited.settings.hostname = '#{ConfigOrbited[:host]}';",
    '  TCPSocket = Orbited.TCPSocket;',
    '</script>',
    "<script src=\"http://#{ConfigOrbited[:host]}:#{ConfigOrbited[:port]}/static/protocols/stomp/stomp.js\"></script>"
    ].join("\n")
  end
  
  def flash_mes
    if flash[:error]
  		{:class => 'error', :mes => flash[:error]}
		elsif flash[:notice]
  		{:class => 'notice', :mes => flash[:notice]}
  	elsif flash[:success]
    	{:class => 'success', :mes => flash[:success]}
		else
      nil
    end
  end
end
