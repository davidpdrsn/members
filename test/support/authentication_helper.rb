module AuthenticationHelper
  def sign_in_as(user)
    http_basic_authenticate
    visit root_url
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "123"
    click_button "Sign in"
  end
end
