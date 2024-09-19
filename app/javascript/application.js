// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import './geolocation'
import "channels"
require("@rails/ujs").start()
require("@turbo-rails/turbo").start() // If using Turbo
