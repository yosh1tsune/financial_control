// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import './best_in_place.js'

$(document).ready(function(){
  $(".best_in_place").best_in_place();
})
