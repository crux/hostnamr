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

# '/hostnamr/generate?count='+$('generateCount').value+'&schema='+$('schema').value+'&syllables='+$('syllables').value+'&join='+$('join_char').value,
get '/generate' do

  # param extraction
  count = Integer(params[:count]) rescue 10
  syllables = Integer(params[:syllables]) rescue 3
  puts "syllables: #{syllables}"
  join_char = params[:join] || ' '
  schema = case params[:schema]
           when 'Hiragana' then Hiragana
           when 'Solmisation' then Solmisation
           else raise "unsupported schema: '#{params[:schema]}'"
           end
 
  # name generation
  hostnames = Array.new(count).collect do
    schema.doit(count: syllables, join: join_char)
  end

  # result rendering
  erb(:hostnames, locals: {hostnames: hostnames})
end
