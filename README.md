# Email Stats

## About :email:

This is a web app built with Ruby on Rails that receives and stores web hook data on email events, and displays statistics including:

* Total number of emails sent
* Total number of emails opened
* Total number of clicks
* Open rate per email type
* Click rate per email type

## Approach :thought_balloon:

I started the project by test-driving the POST `/emails` route inside `emails_controller` to receive coming from the sample data generator, llirdnam. I used Active Record and PostgreSQL for my database. I then started writing class methods and relevant unit tests in the `Email` model to count the number of emails under each event and the open/click rate per email type.

Once that's done I added another `statistics_controller` (with feature tests) to present results, as I think extracting statistics into a separate controller would potentially make the app more scalable and can be used to analyse data for other user activities such as website traffic.

## To run the app :arrow_forward:

Clone this repo and install dependencies:
```
$ git clone https://github.com/junyuanxue/email_stats.git
$ cd email_stats
$ bundle
```
Set up your database:
```
$ rails db:setup
```
Fire up the server:
```
$ rails s
```
In another tab, start the llirdnam listener (`go run listener.go`). And in a third tab, send email data to Rails server: `go run llirdnam.go http://localhost:3000/emails`.

In your rail terminal you should see all the lovely emails data coming in! :)

To view the email statistics, keep the app served up and visit `http://localhost:3000`.

## Testing :white_check_mark:

This app was built in a test-driven manner with RSpec-Capybara. I also used Factory Girl and Faker to create test database objects.

To run the tests, make sure you are in the root directory of the project and have added all the dependencies, then type in terminal:
```
$ rspec
```

## Tools :wrench:
* Ruby on Rails
* RSpec-Capybara
* PostgreSQL
* ActiveRecord
* Factory Girl
* Faker

## Author :cat:
Junyuan Xue

[Github](https://github.com/junyuanxue)
| [CV](https://github.com/junyuanxue/cv)
| [Projects](https://github.com/junyuanxue/cv#projects)
