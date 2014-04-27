require 'sinatra/base'
require 'multi_json'
require 'jbuilder'

module Sinatra
  module Jbuilder
    VERSION   = "1.0"

    def jbuilder(object, status:200, type: :json)
      content_type type
      response.status = status

      ::Jbuilder.encode do |json|
        json.set! :meta do
          json.status status
        end
        json.set! :data do
          if object.class == Array
            json.array! object do |o|
              o.to_json(json)
            end
          else
            object.to_json(json)
          end
        end
      end
    end  
  end

  Base.set :json_encoder do
    ::MultiJson
  end

  Base.helpers Jbuilder
end