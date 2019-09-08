$(function() {
  $(".show-all").one("click", function() {
    $.getJSON("/applications.json", function(data) {
        data.forEach(function(application) {
            let newApplication = new Application(application);
            let applicationHTML = newApplication.showApplications();

            document.getElementById("apps").innerHTML += applicationHTML;

          }
      )});
   });
});


$(function() {
  $(".sort-all").on("click", function() {
    $.getJSON("/applications.json", function(data) {
      const SORTED_APPLICATIONS = data.sort(function(a, b) {
        const NAME_A = a.company_name.toUpperCase();
        const NAME_B = b.company_name.toUpperCase();
          if (NAME_A < NAME_B) {
            return -1;
          }
          if (NAME_A > NAME_B) {
            return 1;
          }
            return 0;
       });
       let applications = SORTED_APPLICATIONS.forEach(function(application) {
          let newApplication = new Application(application);
          let applicationHTML = newApplication.showApplications();

          document.getElementById("apps").innerHTML += applicationHTML;

        }
      );
    });
  });
});

$(function() {
  $(".clear-all").on("click", function() {
    $(".company-info").hide();
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

class Application {
  constructor(obj) {
    this.company_id = obj.company.id;
    this.id = obj.id;
    this.company_name = obj.company_name;
    this.date = obj.date;
  }
}

Application.prototype.showApplications = function() {
  if (this.date !== null) {
  return `
    <div class="company-info">
      <ul>
        <li>
          <a href="/companies/${this.company_id}/applications/${this.id}">${this.company_name}</a>
          <p>${this.date}</p>
        </li>
      </ul>
    </div>`
    } else {
      return `
        <div class="company-info">
          <ul>
            <li>
              ${this.company_name}
              <p>Not yet applied</p>
            </li>
          </ul>
        </div>`

    }
}
