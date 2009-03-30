class MessagesController < ApplicationController
  include Utils::SQL
  def create    
    if Chat.check_user(:chat_id => params[:chat_id], :client_id => params[:username], :session_id => params[:check_code])
      conn {|c| c.insert "INSERT INTO messages SET  message = '#{c.quote_string(params[:message])}', 
                                                    login='#{c.quote_string(params[:username])}',
                                                    chat_id='#{c.quote_string(params[:chat_id])}'"}    
      render :juggernaut => {:type => :send_to_channels, :channels => [params[:chat_id]]} do |page|
        page.insert_html :top, 'chat_data', "<li>#{h params[:username]}: #{h params[:message]}</li>"
      end
      render :nothing => true
    else
      head 403
    end
  end
end

