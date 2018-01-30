require "application_system_test_case"

class WelcomeTest < ApplicationSystemTestCase
  test "welcome message" do
    visit root_url
    assert_selector "h1", text: "Members"
  end
end
