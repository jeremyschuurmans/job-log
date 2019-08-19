# JobLog

Job hunting sucks. But it doesn't have to. JobLog is a tool for helping job-seekers stay focused and organized in the job hunt. It allows you to quickly see specific companies you want to work at, and when you apply to those companies, log the date of application, if and when you followed up, and the response.

## Installation

This app is live at [](https://my-job-log.herokuapp.com). You can create your own account the standard way, or via OmniAuth GitHub. A demo account is also setup (username: "john.doe@examplemail.com", password: "securepassword").

To play with the app locally,

1. Clone this repo.

2. `cd` into the appropriate directory.

3. Run `bundle install` to install required gems.

4. Run `rails db:migrate`.

5. Run `rspec` to run the test suite. Green means go.

## Usage

1. When you create an account, you will be logged in taken to a blank page. This is where you will put all the companies you want to apply to.

2. Click the *Add a New Company* link on the menu bar.

3. Fill out the form and click the submit button. You will immediately see the information you submitted, and should see the logo or relevant picture of the company.

4. Click the *Companies* link on the menu bar. You will see the company, along with buttons to *View*, *Edit*, or *Apply* to the company. Clicking the *Show Application* button will allow you to immediately see all the companies you need to apply to, and the date of application if you have applied.

5. Add as many companies as you like.

6. When you click the *Apply* button, you will be taken to a form that allows you to specify the date you applied to that company. Fill out the date and click the submit button.

7. Click *Applications* on the menu bar, and you will be able to see all applications you have submitted.

8. When you follow up with the company, click *Show Applications* and click the company name, or go to *Applications* and click *Edit*. Check the followup check box, and make any notes you need to.

9. You can also view and edit individual companies and applications as needed.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/palledorous/vino or by email to schuurm@ns.codes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Disclaimer

JobLog is a personal student project and as such is intended solely for educational purposes. I have made efforts to follow fair use guidelines in my use of all material under copyright.
