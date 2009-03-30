require 'digest/sha1'
class ChatsController < ApplicationController
  def show
    @chat_id = "defero-#{params[:id]}"
  end
  
  def create
    
  end
  
  def index
    @new_chat_id = Digest::SHA1.hexdigest(Time.now.to_s + request.remote_ip)[0..10]
  end
  
  def generate_js
    render :layout => false
  end
  
end
