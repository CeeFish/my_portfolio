document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("dynamic-projects");
  fetch("/projects.json")
    .then(res => res.json())
    .then(projects => {
      container.innerHTML = "";
      projects.slice(3).forEach(p => {
        container.insertAdjacentHTML("beforeend", projectCardHtml(p));
      });
    })
    .catch(() => {
      container.innerHTML = `<div class="col-12 text-center text-danger">
        Could not load extra projects.
      </div>`;
    });

  function projectCardHtml(p) {
    return `
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <div class="card-body">
            <h5 class="card-title">${p.name}</h5>
            <p class="card-text">${p.description || ""}</p>
            <a href="${p.url}" target="_blank"
               class="btn btn-outline-primary">View</a>
          </div>
        </div>
      </div>`;
  }
});