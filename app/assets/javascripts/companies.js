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

$(function() {
  $(".next-company").on("click", function() {
    let companyId = parseInt($(".next-company").attr("company-id")) + 1;
    $.getJSON("/companies/" + companyId + ".json", function(data) {
      let companyUrl = data.name.toLowerCase().replace(/\s/g, '') + ".com";
      $(".company-logo").attr("src", "https://logo.clearbit.com/" + companyUrl)
      $(".company-name").text(data.name);
      $(".company-street-address").text(data.address.street_address);
      $(".company-city").text(data.address.city);
      $(".company-state").text(data.address.state);
      $(".company-zip").text(data.address.zip);
      $(".company-telephone").text(data.telephone_number);
      $(".company-contact").text(data.contact_person);
      if (data.applied === true) {
        $(".company-applied").text("Applied");
      } else {
        $(".company-applied").text("Not yet applied");
      };

      $(".next-company").attr("company-id", data.id);
    });
  });
});
