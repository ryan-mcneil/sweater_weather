# README

# Sweater Weather

Sweater Weather is a simple, single page application that displays the current weather and forecast for a given location. As a Registered User, favorite locations can be managed. This application builds the API for the front end to consume. The deployed API can be found at https://sweater-weather-288.herokuapp.com. The deployed Front End is deployed to https://ryan-mcneil.github.io/sweater_weather_front_end/ with it's repository at https://github.com/ryan-mcneil/sweater_weather_front_end.

## Initial Setup

1. Run `git clone git@github.com:ryan-mcneil/sweater_weather.git` in folder for the repository to live.

2. Run `bundle` to install necessary libraries locally

3. Run `rails s` and visit http://localhost:3000/ to visit the application running locally.

## How to use

### Visit any of the following endpoints to receive data from the application
  Note: replace values in <> brackets with your own input

 - Get Forecast for Location
  /api/v1/forecast?location=<location_name>

 - Create User
  (POST) api/v1/users?email=<whatever@example.com>&password=<password>&password_confirmation=<password>
  Note: This will return an API key to use in other endpoints

 - User Log In
  (POST) api/v1/users?email=<whatever@example.com>&password=<password>
  Note: This will return an API key to use in other endpoints

 - Create a Favorite for User
  (POST) /api/v1/favorites?location=<location_name>&api_key=<user_api_key>

 - Get User Favorites
  /api/v1/favorites?api_key=<user_api_key>

 - Delete User Favorite
  (DELETE) /api/v1/favorites?location=<location_name>&api_key=<user_api_key>

 - Get Weather Gif
  /api/v1/gifs?location=<location_name>

  * The following API keys are for Users already in the Development and Production Databases, respectively:
  Development: User API Key: 265c45f154819d7e2942beb876682d
  Heroku: User API Key: 30ea9d6a0766c61fe12ca9bf370178

## Known Issues

 - The application currently does not parse and update location names to display them correctly. Error handling for this will be introduced in future iterations.

## Testing

 - Run `bundle exec rspec` for text coverage

## How to Contribute

 - Please send any pull requests if you'd like to make any additions!

## Built With
 * [Ruby](https://www.ruby-lang.org/en/)
 * [Rails](https://rubyonrails.org/)
 * [PostgreSQL](https://www.postgresql.org/)
 * [Faraday](https://github.com/lostisland/faraday)
 * [Figaro](https://github.com/laserlemon/figaro)
 * [Bcrypt](https://github.com/codahale/bcrypt-ruby)
 * [FastJSON API](https://github.com/Netflix/fast_jsonapi)
 * [RSpec](rspec.info/)
 * [Capybara](https://github.com/teamcapybara/capyba)
 * [Webmock](https://github.com/bblimke/webmock)
 * [VCR](https://github.com/vcr/vcr)
 * [Rack-Cors](https://github.com/cyu/rack-cors)
