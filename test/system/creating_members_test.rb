require "application_system_test_case"

class CreatingMembersTest < ApplicationSystemTestCase
  test "creating a member" do
    user = User.create!(email: "foo@bar.com", password: "123")
    sign_in_as user

    click_link "Create new member"

    fill_in "First name", with: "Bob"
    fill_in "Middle name", with: "Alice"
    fill_in "Last name", with: "Cindy"

    fill_in "Email", with: "bob@example.com"

    today = Date.today
    select today.year, from: "member_date_of_birth_1i"
    select today.strftime("%B"), from: "member_date_of_birth_2i"
    select today.day, from: "member_date_of_birth_3i"

    select today.year, from: "member_admission_date_1i"
    select today.strftime("%B"), from: "member_admission_date_2i"
    select today.day, from: "member_admission_date_3i"

    select "Active", from: 'Membership type'

    click_button "Create member"

    assert_selector ".flash", text: "Member created"
    assert_selector "h1", text: "Bob Alice Cindy"

    click_link "All members"
    assert_selector "li", text: "Bob Alice Cindy"
  end

  test "does not allow empty names" do
    user = User.create!(email: "foo@bar.com", password: "123")
    sign_in_as user

    click_link "Create new member"

    fill_in "First name", with: ""
    fill_in "Middle name", with: ""
    fill_in "Last name", with: ""
    today = Date.today
    select today.year, from: "member_date_of_birth_1i"
    select today.strftime("%B"), from: "member_date_of_birth_2i"
    select today.day, from: "member_date_of_birth_3i"
    select "Active", from: 'Membership type'
    click_button "Create member"

    assert_selector ".flash", text: "Something went wrong"

    click_link "All members"
    assert_no_selector "li", text: "Bob Alice Cindy"
  end
end
