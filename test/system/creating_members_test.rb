require "application_system_test_case"

class CreatingMembersTest < ApplicationSystemTestCase
  test "creating a member" do
    user = User.create!(email: "foo@bar.com", password: "123")
    sign_in_as user

    click_link "Create new member"

    fill_in "First name", with: "Bob"
    fill_in "Middle name", with: "Alice"
    fill_in "Last name", with: "Cindy"
    today = Date.today
    select today.year, from: "member_date_of_birth_1i"
    select today.strftime("%B"), from: "member_date_of_birth_2i"
    select today.day, from: "member_date_of_birth_3i"
    select "Active", from: 'Membership type'
    click_button "Create member"

    assert_selector ".flash", text: "Member created"
    assert_selector "p", text: "Bob Alice Cindy"

    click_link "All members"
    assert_selector "li", text: "Bob Alice Cindy"
  end
end
