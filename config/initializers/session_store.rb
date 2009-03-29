# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_defero_session',
  :secret      => '1256a78c69124d4214ac6cbb6e0f7bcbb53e8457036ea147698e30241fef190ff857ec0cc9e485e6b720b9abff19aabfc602fc012af9c91cfee45d0440faaf48'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
