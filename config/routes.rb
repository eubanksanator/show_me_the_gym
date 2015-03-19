Rails.application.routes.draw do

  get '/' => 'locations#index'

  get '/gym' => 'locations#address'

end
