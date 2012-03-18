Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '299340683464316', 'd8b1462930c17497eef882a4ef56be51'
end