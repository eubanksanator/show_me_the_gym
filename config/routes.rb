Rails.application.routes.draw do

  get '/gym/:address', to: 'locations#address'

end
