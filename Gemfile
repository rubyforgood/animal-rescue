source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.4"

gem "active_storage_validations"
gem "activeadmin"
gem "acts_as_tenant"
gem "azure-storage-blob", "~> 2.0", require: false
gem "bootsnap", require: false
gem "bootstrap"
gem "chartkick", "~> 5.0"
gem "city-state", "~> 0.1.0"
gem "dartsass-rails"
gem "devise"
gem "figaro"
gem "geocoder"
gem "importmap-rails"
gem "jbuilder"
gem "phonelib"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3"
gem "rails-i18n"
gem "requestjs-rails", "~> 0.0.10"
gem "sprockets-rails"
gem "stimulus-rails"
gem "strong_migrations"
gem "traceroute"
gem "turbo-rails"

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "annotate"
  gem "brakeman"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 6.0.3"
  gem "rspec-retry"
  gem "standard"
end

group :development do
  gem "better_errors", "~> 2.9", ">= 2.9.1"
  gem "guard", "~> 2.18"
  gem "guard-livereload", "~> 2.5", ">= 2.5.2", require: false
  gem "letter_opener", group: :development
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "cuprite"
  gem "evil_systems", "~> 1.1"
  gem 'selenium-webdriver'
  gem "shoulda", "~> 4.0"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end

