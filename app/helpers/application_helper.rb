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
end
