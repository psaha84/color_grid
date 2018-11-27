source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.1.3'
gem 'ejs', '~> 1.1.1'
gem 'jquery-rails'
gem 'jquery-minicolors-rails'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'database_cleaner'
end  

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
