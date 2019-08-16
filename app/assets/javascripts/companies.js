$(function() {
  $(".show-all").on("click", function() {
    $.get("/applications" + ".json", function(data) {
      let companies = data.map(c => {
        if (c.date !== null) {
        return `
          <div class="company-info">
            <ul>
              <li>
                <a href="/companies/${c.company.id}/applications/${c.id}">${c.company_name}</a>
                <p>${c.date}</p>
              </li>
            </ul>
          </div>`
        } else {
          return `
            <div class="company-info">
              <ul>
                <li>
                  ${c.company_name}
                  <p>Not yet applied</p>
                </li>
              </ul>
            </div>`
          };
        }).join(' ');
      $("#apps").html(companies);
    });
    $(".clear-all").on("click", function() {
      $(".company-info").hide();
    });
  });
});
