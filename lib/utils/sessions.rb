module Utils
  module Sessions
    def get_session_by_id(id = '')
      Rails.cache.read(ActionController::Session::AbstractStore::ENV_SESSION_KEY + ':' + id)
    end
    
    
  end
end