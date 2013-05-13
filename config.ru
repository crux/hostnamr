require 'rubygems'
require 'bundler'
Bundler.require

$:.unshift(File.dirname(__FILE__))              
require './hostnamr_app'

run Sinatra::Application
