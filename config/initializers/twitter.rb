require 'twitter'
require 'yaml'

auth = YAML.load(File.expand_path('../not_public/twitter_app.yml', __FILE__))

Twitter.configure do |config|
  config.consumer_key = auth['consumer_key']
  config.consumer_secret = auth['consumer_secret']
  config.oauth_token = auth['oauth_token']
  config.oauth_token_secret = auth['oauth_token_secret']
end