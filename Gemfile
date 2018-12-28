source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'mini_magick', '~> 4.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'jbuilder', '~> 2.8'
gem "bulma-rails", "~> 0.7.2"
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'terminal-notifier-guard'
  gem 'xray-rails'
end
