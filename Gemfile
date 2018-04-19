source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'pry'
gem 'basscss-rails'
gem 'omniauth'
gem 'multi_xml'
gem 'omniauth-oauth'
gem 'figaro'
gem 'faraday'
gem 'json'
gem 'active_model_serializers'
gem 'jquery-rails'
gem 'devise'
gem 'google_places'
gem 'geocoder'
gem 'bullet'

group :development, :test do
  gem 'vcr'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end

group :test do
  gem 'webmock'
  gem 'coveralls', require: false
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
