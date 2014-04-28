require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

    @db = DB[:shoes]

  end

  get '/' do
    erb :index, locals: {shoes: @db.to_a}
  end

  get '/shoes/new' do
    erb :'shoes/new'
  end

  post '/shoes' do
    @db.insert(name: params[:name], size: params[:size])

    redirect '/'
  end

  get '/shoes/:id' do
    shoes = @db[id: params[:id]]
    erb  :'/shoes/show', locals: {shoes: shoes}
  end
end