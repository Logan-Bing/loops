// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require cocoon
$(document).on('turbolinks:load', function() {
  $('.nested-fields').cocoon();
});
//= require jquery3
