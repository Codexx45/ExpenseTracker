# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap/dist/js/bootstrap.bundle.min.js"
pin "AdminLTE", to: "AdminLTE/dist/js/adminlte.min.js"
pin "apexcharts", to: "https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.esm.js"