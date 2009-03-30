class User < ActiveRecord::Base
  include Clearance::App::Models::User
  
  has_many :sites
end