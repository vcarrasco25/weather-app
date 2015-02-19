require 'sinatra'
require 'yahoo_weatherman'

get '/' do
  erb :home
end

def get_weather(post)
  @client = Weatherman::Client.new
  weather_info = @client.lookup_by_location(post).condition['text']
  return weather_info.downcase
end

post '/weather' do
  post = params[:post]['location']
  @weather = get_weather(post)

  "#{@weather}"

  if(@weather == 'sunny')
    erb :sunny

  elsif(@weather == 'cloudy')
    erb :cloudy

  elsif(@weather == 'snowy')
    erb :snowy

  elsif(@weather == 'fair')
    erb :fair

  elsif(@weather == 'rainy')
    erb :rainy

  elsif(@weather == 'partly cloudy')
    erb :partly_cloudy

  elsif(@weather == 'clear')
    erb :clear

  else
    erb :default
  end

end
