if Rails.env.production?
  GOOGLE_PLACES_API_KEY = ENV["ZEBRA"]
else
  GOOGLE_PLACES_API_KEY = YAML.load_file(Rails.root.join('config/application.yml'))['googles_api_key']
end
