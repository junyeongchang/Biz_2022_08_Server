document.addEventListener("DOMContentLoaded", () => {
  const todo_table = document.querySelector("table.todo");
  const check = document.querySelector("button.check");

  todo_table?.addEventListener("click", (e) => {
    const td = e.target;
    const className = td.className;

    if (td.tagName === "TD") {
      const tr = td.closest("TR");
      const seq = tr.dataset.seq;

      if (className === "td-button") {
        document.location.href = `${rootPath}/todo/${seq}/completion`;
      } else {
        document.location.href = `${rootPath}/todo/${seq}/detail`;
      }
    }
  });
});
