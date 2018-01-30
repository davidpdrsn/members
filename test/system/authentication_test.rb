require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  test "signing up" do
    page.driver.basic_authorize(
      ENV.fetch("BASIC_AUTH_USERNAME"),
      ENV.fetch("BASIC_AUTH_PASSWORD"),
    )

    visit root_url

    click_link "Sign up"
    fill_in "Email", with: "foo@bar.com"
    fill_in "Password", with: "123"
    click_button "Sign up"

    assert_selector "p", text: "Signed in as foo@bar.com"
  end

  test "signing in" do
    page.driver.basic_authorize(
      ENV.fetch("BASIC_AUTH_USERNAME"),
      ENV.fetch("BASIC_AUTH_PASSWORD"),
    )

    user = User.create!(
      email: "foo@bar.com",
      password: "123",
    )

    visit root_url

    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "123"
    click_button "Sign in"

    assert_selector "p", text: "Signed in as #{user.email}"
  end
end
