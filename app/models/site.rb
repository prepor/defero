class Site < ActiveRecord::Base
  belongs_to :user
  
  def self.site_name_from_chat_id(chat_id)
    chat_id.match(/([\w\d_]+?)-/)[1]
  end
  

end
