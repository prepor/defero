class Chat < ActiveRecord::Base
  
  def self.list_of_users(chat_id)
    Rails.cache.fetch("#{chat_id}-users") { Array.new }
  end
  def self.check_user(params)
    site_name = Site.site_name_from_chat_id(params[:chat_id])
    site = Rails.cache.fetch("site-#{site_name}") { Site.find_by_name(site_name).attributes }
    # debugger
    if !site['anonymous'] && (!params[:session_id] || Digest::SHA1.hexdigest(params[:client_id] + site['secret_key']) != params[:session_id])
      false
    else
      true
    end
  end

end
