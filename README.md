# Rails Engine

Rails Engine is an API developed for the Back-End Engineering program at Turing School of Software and Design. For this project I practiced CRUD and DHH Convention with my controller use. The purposes of this project in Advanced Active Record Querying, and exposing API endpoints for the [Rails Driver](https://github.com/turingschool-examples/rails_driver)

## LocalHost Deployment

Rails Engine uses Ruby 2.5.3 and Rails 5.2.4.2 See the included Gemfile for other gem and library dependencies.

Follow these steps in your command line terminal to set up Rails Engine on your computer:

 - Clone this repo with SSH OR HTTPS 
```
  git clone git@github.com:jKwibe/rails_engine_api.git
# OR
  git clone https://github.com/jKwibe/rails_engine_api.git
```
 - Change your working directory to the project's root directory:
```
  cd rails_engine_api
```
 - Install required gems:
```
  bundle install
```
 - Create and migrate the database:
```
  rails db:{create,migrate,seed}
```
 - Import data from included CSV files (may take several minutes):
 ```
  rake import
```
 - To run test suite:
```
  bundle exec rspec
```

 - Start the Rails server: 
```
  rails s
```

Running `rails s`, by default will start the server on port 3000. 


### Endpoints Documentation
[Endpoints](https://nifty-noyce-8fcef7.netlify.app)
