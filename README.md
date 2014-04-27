Intro
=========
a plugin to use jbuilder in sinatra
jbuilder: https://github.com/rails/jbuilder

Concept
=========
model class takes responsibility for rendering json

Usage
=========
require 'sinatra/jbuilder'

ex: 
```
class Human
  ...
  ...
  # model class has to implement to_json method
  def to_json(json)
   json.id id
   json.name name
  end
end

get '/object' do
  o = Human.new
  jbuilder o
end

get '/array' do
  array = Human.all
  jbuilder array
end
```

```
{
  meta: {
    status: 200
  },
  data: {
    id: 1,
    name: 'akira'
  }
}
```

Copyright
=========
Copyright (c) 2014 Akira Hirakawa. See LICENSE for details.
