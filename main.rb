require 'sinatra'
require 'jwt'
require 'erb'

get '/' do
  
  seller_secret = "your_seller_secret"
  seller_id = "your_seller_id"

  @cake_jwt = JWT.encode(
    {
      "iss" => seller_id,
      "aud" => "Google",
      "typ" => "google/payments/inapp/item/v1",
      "exp" => (Time.now + 3600).to_i,
      "iat" => Time.now.to_i,
      "request" => {
        "name" => "Piece of Cake",
        "description" => "Virtual chocolate cake to fill your virtual tummy",
        "price" => "10.50",
        "currencyCode" => "USD",
        "sellerData" => "user_id:1224245,offer_code:3098576987,affiliate:aksdfbovu9j"
      }
    },
    sellet_secret )
  

  erb :index
end

post '/' do
 seller_secret = "your_seller_secret" 
 data = JWT.decode(params[:jwt], seller_secret)
 data['response']['orderId']
end
