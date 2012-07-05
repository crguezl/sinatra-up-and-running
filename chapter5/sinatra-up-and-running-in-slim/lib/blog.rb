#!/usr/bin/env ruby -I ../lib -I lib

require 'sinatra'
require 'ostruct'
require 'yaml'
require 'time'
require 'slim'
#require 'redcarpet'
require 'rdiscount'

#Slim::Engine.set_default_options :sections => true
Slim::Engine.set_default_options :pretty => true


class Blog < Sinatra::Base
  set :root, File.expand_path('../../', __FILE__)
  set :articles, []
  set :app_file, __FILE__

  Dir.glob "#{root}/articles/*.md" do |file|
    # parse meta data and content from file
    meta, content  = File.read(file).split("\n\n", 2) 

    # generate a metadata object
    article = OpenStruct.new YAML.load(meta) 
    
    # convert the date to a time object
    article.date = Time.parse article.date.to_s 

    # add the content
    article.content = content

    # generate a slug for the url
    article.slug = File.basename(file, '.md')

    # set up the route
    get "/#{article.slug}" do
      slim :post, :locals => { :article => article }
    end

    # Add article to list of articles
    articles << article
  end

  # Sort articles by date, display new articles first
  articles.sort_by! { |article| article.date }
  articles.reverse!
  get '/' do
    slim :index
  end
end
