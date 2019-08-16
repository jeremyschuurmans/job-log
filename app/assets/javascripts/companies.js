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
                  <a href="/companies/${c.company.id}/applications/${c.id}">${c.company_name}</a>
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
  setupCreateNewCompany();
});

function createNewCompany(url, data) {
  $.post(url, data, "json")
   .done(json => {
     let newCompany = new Company(json);
     newCompany.updateHTML();
  });
};

class Company {
  constructor(json) {
    this.data = json;
  }
  updateHTML() {
    let companyLink = `<a href="/companies/${this.data.id}">${this.data.name}</a>`;
    let companyUrl = this.data.name.toLowerCase().replace(/\s/g, '') + ".com";
    let companyLogo = `<img src="https://logo.clearbit.com/${companyUrl}">`;

    $(".logo").html(companyLogo);
    $(".link").html(companyLink);
    $(".street-address").text(this.data.address.street_address);
    $(".city").text(this.data.address.city);
    $(".state").text(this.data.address.state);
    $(".zip").text(this.data.address.zip_code);
    $(".telephone").text(this.data.telephone_number);
    $(".contact").text(this.data.contact_person);
  };
};

function setupCreateNewCompany() {
  $("form").submit(function(event) {
    event.preventDefault();

    let inputValues = $(this).serialize();
    let url = $(this).attr("action");

    createNewCompany(url, inputValues);
  });
};
