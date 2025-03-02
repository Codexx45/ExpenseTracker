// app/javascript/packs/application.js
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "Administrator/js/adminlte.min"
import "apexcharts"
import "@rails/ujs"

document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('.modal').forEach(function(modal) {
    modal.addEventListener('shown.bs.modal', function () {
      modal.querySelector('.btn-danger').focus();
    });

    modal.addEventListener('hidden.bs.modal', function () {
      document.querySelector('[data-bs-target="#' + modal.id + '"]').focus();
    });
  });
});