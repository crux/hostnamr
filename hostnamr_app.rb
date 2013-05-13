#!/usr/bin/env ruby 
# dirk (at) sebrink.de

require 'rubygems'
require 'bundler/setup'

# this will require all the gems not specified to a given group (default)
# and gems specified in your test group
Bundler.require(:default, :test)

require 'hiragana'
require 'solmisation'

get '/' do
  redirect to('/index.html')
end

def get_request_params params
  [
    (Integer(params[:count]) rescue 10),
    (Integer(params[:syllables]) rescue 3),
    (join_char = params[:join] || ' '),
    case params[:schema]
    when 'Hiragana' then Hiragana
    when 'Solmisation' then Solmisation
    else raise "unsupported schema: '#{params[:schema]}'"
    end
  ]
end

# '/hostnamr/generate?count='+$('generateCount').value+'&schema='+$('schema').value+'&syllables='+$('syllables').value+'&join='+$('join_char').value,
get '/generate' do

  # request param extraction
  count, syllables, join_char, schema = get_request_params(params)
 
  # name generation
  hostnames = Array.new(count).collect do
    schema.doit(count: syllables, join: join_char)
  end

  # result rendering
  erb(:hostnames, locals: {hostnames: hostnames})
end
