# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "@mapbox/mapbox-gl-geocoder", to: "@mapbox--mapbox-gl-geocoder.js" # @5.0.2
pin "#lib/client.js", to: "#lib--client.js.js" # @0.13.7
pin "@mapbox/fusspot", to: "@mapbox--fusspot.js" # @0.4.0
