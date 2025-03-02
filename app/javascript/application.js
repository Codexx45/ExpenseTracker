// app/javascript/packs/application.js
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "Administrator/js/adminlte.min"
import "apexcharts"
import "@rails/ujs"

document.addEventListener('turbolinks:load', function() { // Fix: "turbolinks", not "turbulinks"
  console.log("Page loaded");
  document.querySelectorAll('.delete-button').forEach(function(button) { // Fix: ".delete-button" (no slash)
    button.addEventListener('ajax:success', function() {
      console.log("Delete successful");
      window.location.reload();
    });
  });
});