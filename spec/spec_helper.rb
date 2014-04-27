require 'jbuilder'
require 'sinatra/contrib'
require 'sinatra/jbuilder'

RSpec.configure do |config|
  config.expect_with :rspec
  config.include Sinatra::TestHelpers
end