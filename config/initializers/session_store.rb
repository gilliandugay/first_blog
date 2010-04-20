# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_myblog_session',
  :secret      => '56495b40c09ee78dee8edcc06f7b4de4ded9b22d0b9461b684932590ab14178a68506228caaae7b9208cec1584caf6c7a0d99161611bc7213259d9ad86312973'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
