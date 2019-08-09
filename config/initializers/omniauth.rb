Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  else
    provider :github, ENV['GITHUB_KEY_PRODUCTION'], ENV['GITHUB_SECRET_PRODUCTION']
  end
end
