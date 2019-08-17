Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET']
  else
    provider :github, ENV['GITHUB_CLIENT_ID_PRODUCTION'], ENV['GITHUB_CLIENT_SECRET_PRODUCTION']
  end
end
