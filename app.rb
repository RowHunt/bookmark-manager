require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  get '/bookmarks' do
    # p ENV
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  post '/bookmarks' do
    p params
    p "Form data submitted to the /bookmarks route!"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
