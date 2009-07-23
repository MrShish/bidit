# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bidit_session',
  :secret      => 'e3a4d113a6b53c570c04d29933c3ff5a77f66fa69aa38cccab885df74099cdad10d60b0b4820bb11fe7b6f4e9e7c4d9b0f5fe766722a6b5509ba9276794e2012'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
