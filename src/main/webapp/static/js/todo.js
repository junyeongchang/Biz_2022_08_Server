document.addEventListener("DOMContentLoaded", () => {
  const todo_table = document.querySelector("table.todo");

  todo_table?.addEventListener("click", (e) => {
    const td = e.target;
    if (td.tagName === "TD") {
      const tr = td.closest("TR");
      const seq = tr.dataset.seq;
      document.location.href = `${rootPath}/todo/${seq}/detail`;
    }
  });
});
