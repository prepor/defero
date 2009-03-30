require 'digest/sha1'
class ConnectionsController < ApplicationController
  include Utils::Sessions
  
  before_filter :set_env
  
  def index
    
  end
  
  def create
    # debugger
    # ses = get_session_by_id(params[:session_id])

    if Chat.check_user(:chat_id => @chat_id, :client_id => @client_id, :session_id => params[:session_id])
      list_of_users = Chat.list_of_users(@chat_id).dup
      
      unless list_of_users.include? @client_id
        # debugger
        list_of_users << @client_id
        Rails.cache.write("#{@chat_id}-users", list_of_users)
        # Rails.cache.read "#{@channel}-users"
      end
      update_list_of_users(list_of_users)
      head 200
    else
      head 403      
    end
  end
  
  def destroy
    list_of_users = Chat.list_of_users(@chat_id).dup
    # debugger
    if (index = list_of_users.index(@client_id))
      list_of_users.delete_at(index)
      Rails.cache.write("#{@chat_id}-users", list_of_users)
    end
    update_list_of_users(list_of_users)
    head 200
  end
  
  
  private
  def update_list_of_users(list_of_users)
    render :juggernaut => {:type => :send_to_channels, :channels => [@chat_id]} do |page| 
      page.replace_html 'list_of_users', list_of_users.join(', ')
    end
  end
  def set_env
    @chat_id = params[:channels].first
    @client_id = params[:client_id]
  end
  
  

end
