# Members

App to keep track of members in martial club.

This app is being built live on stream at `twitch.tv/davidpdrsn`

## Tuesday 6th of February

- [x] Admin authorization/authentication

- [x] members#show

- [x] New membership types
  - [x] Setup [factory bot](https://github.com/thoughtbot/factory_bot)

- [x] members#index
  - [x] Filters
    - [x] Membership type
    - [x] Below `n` years of age or above (25 special, 15 kids)
  - [x] Pagination

- [ ] Payments
  - [x] Make list of pending and payed payments
  - [ ] Send email when creating pending payments
    - Maybe use https://rubygems.org/gems/mailcatcher/versions/0.6.1
  - [ ] Notify members that their payment has been registered
  - [ ] Group payed payments by date in view

- [ ] Update `members#new` with the new fields from below

- [x] New member fields
  - [x] Nationality
  - [x] Address
  - [x] Zip
  - [x] City
  - [x] Hide address (boolean)
  - [x] CPR
  - [x] Phone
  - [x] Mom's phone
  - [x] Dad's phone
  - [x] Email
  - [x] Mom's email
  - [x] Dad's email
  - [x] Admission date

- [ ] Deploy to Heroku
