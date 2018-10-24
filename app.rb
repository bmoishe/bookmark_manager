require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  before do
    @bookmarks = Bookmark.all
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    erb :view
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    @url = params[:url]
    @title = params[:title]
    Bookmark.create(url: @url, title: @title)
    erb :add
  end


  run! if app_file == $0
end
