document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll('a.nav-link[href^="#"]').forEach(anchor => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault();

      const target = document.querySelector(this.getAttribute("href"));
      if (target) {
        window.scrollTo({
          top: target.offsetTop - 70, // 70px offset for navbar height
          behavior: "smooth"
        });
      }
    });
  });
});
