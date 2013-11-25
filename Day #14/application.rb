require 'sinatra'
#require 'pry-debugger'
require './models/app'
Dir.glob('./controllers/*', &method(:require))