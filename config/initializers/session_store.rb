# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ume_session',
  :secret      => '5aad0275b0fd47a1e0360b22bb57e324cd8a9e7096f6db817e9a1ffa92180bd958a3272112ca61f7838bb4ed35f255a55f3e6195766f7b44c0f604f900c32732'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
