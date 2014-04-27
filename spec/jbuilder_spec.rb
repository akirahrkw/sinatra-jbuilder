require_relative 'spec_helper'

describe Sinatra::Jbuilder do

  class Human
    def initialize(first_name:'akira', last_name:'hirakawa')
      @last_name = last_name
      @first_name = first_name
    end

    def to_json(json)
      json.last_name @last_name
      json.first_name @first_name
    end
  end

  it 'changes http status' do
    mock_app {
      get('/') {
        o = Human.new
        jbuilder o, status:400
      }
    }
    o = get('/')
    expect(o.status).to eq 400
    json = JSON.parse(o.body)['meta']
    expect(json['status']).to eq 400
  end

  it 'changes content-type' do
    mock_app {
      get('/') {
        o = Human.new
        jbuilder o, type: :js
      }
    }
    o = get('/')
    expect(o['Content-Type']).to eq 'application/javascript;charset=utf-8'
  end

  it 'gets object' do
    mock_app {
      get('/') {
        o = Human.new
        jbuilder o
      }
    }
    o = get('/')
    expect(o['Content-Type']).to eq 'application/json'
    json = JSON.parse(o.body)['data']
   
    expect(json['last_name']).to eq 'hirakawa'
    expect(json['first_name']).to eq 'akira'
  end

  it 'gets array' do
    mock_app {
      get('/') {
        array = []
        array << Human.new
        array << Human.new
        array << Human.new
        array << Human.new
        array << Human.new
        jbuilder array
      }
    }

    o = get('/')
    expect(o['Content-Type']).to eq 'application/json' 
    json = JSON.parse(o.body)['data']

    expect(json.class).to eq Array
    expect(json.size).to eq 5
  end
end
