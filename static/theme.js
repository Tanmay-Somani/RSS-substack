document.addEventListener("DOMContentLoaded", () => {
  const root = document.documentElement;
  const btn = document.getElementById("theme-toggle");
  const saved = localStorage.getItem("theme");
  if (saved) root.setAttribute("data-theme", saved);
  else root.setAttribute("data-theme", "dark");

  if (btn) {
    btn.addEventListener("click", () => {
      const next = root.getAttribute("data-theme") === "dark" ? "light" : "dark";
      root.setAttribute("data-theme", next);
      localStorage.setItem("theme", next);
    });
  }
});
