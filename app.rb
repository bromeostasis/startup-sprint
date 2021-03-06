require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    @error = params['error']
    @email = params['email']
    @name = params['name']
    @city = params['city']
    erb :home
  end

  post '/subscribe' do
    full_name = params[:full_name]
    email = params[:email]
    city = params[:city]

    if !email.match(/.+@.+/)
      redirect to("/?error=email&email=#{email}&city=#{city}&name=#{full_name}")
    end

    erb :subscribe
  end

  get '/reddit' do
    # TODO: we can probably get the listings with something like:
    posts = JSON.parse(RestClient.get('http://reddit.com/.json'))

    @listings = posts["data"]["children"]

    erb :reddit
  end

  get '/schedule' do
    @today = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Product Meeting'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Call it a day'],
    ]

    @tomorrow = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Inbox Zero'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Meetup Presentation'],
    ]

    erb :schedule
  end

  get '/home' do
    @error = params['error']
    erb :home
  end

  get '/youtube' do
    erb :youtube
  end
    get '/splash' do
    erb :splash
  end

end
