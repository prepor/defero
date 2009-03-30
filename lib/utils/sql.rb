module Utils::SQL
  def conn(&block)
    yield(ActiveRecord::Base.connection)
  end
  
end