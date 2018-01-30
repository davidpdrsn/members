require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  test "signing up" do
    http_basic_authenticate

    visit root_url

    click_link "Sign up"
    fill_in "Email", with: "foo@bar.com"
    fill_in "Password", with: "123"
    click_button "Sign up"

    assert_selector "p", text: "Signed in as foo@bar.com"
  end

  test "signing in" do
    http_basic_authenticate

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
