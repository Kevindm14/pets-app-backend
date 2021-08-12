source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem 'carrierwave', '~> 0.11.2'
gem 'mimemagic', '~> 0.4.3'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'jwt'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'
gem 'rexml', '~> 3.2', '>= 3.2.5'
gem 'bcrypt', '~> 3.1', '>= 3.1.16'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'capybara', '~> 3.35', '>= 3.35.3'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'rubocop', '~> 1.18', '>= 1.18.4'
end

group :test do
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'webdrivers', '~> 4.6'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
