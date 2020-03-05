# Note, the domain is only needed when the app is in production or deployed
if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_shred-share-api', domain: 'your-frontend-domain'
else
  Rails.application.config.session_store :cookie_store, key: '_shred-share-api'
end
