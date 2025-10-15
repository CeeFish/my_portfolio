// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"


document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.getElementById("dark-toggle");
  toggle?.addEventListener("click", () => {
    document.body.classList.toggle("dark-mode");
  });
});
