require "application_system_test_case"

class FilteringMembersTest < ApplicationSystemTestCase
  test "filtering on membership types" do
    active_member = create :member, membership_type: :active
    passive_member = create :member, membership_type: :passive
    family_member = create :member, membership_type: :family

    user = create :user, password: "123"
    sign_in_as user

    visit root_url
    click_link "All members"

    select "Active", from: "Membership type"
    click_button "Filter"

    assert_selector "p", text: "1 matching member"
    assert_selector "a", text: active_member.name
    assert_no_selector "a", text: passive_member.name
    assert_no_selector "a", text: family_member.name
  end

  test "filtering on all membership types" do
    active_member = create :member, membership_type: :active
    passive_member = create :member, membership_type: :passive
    family_member = create :member, membership_type: :family

    user = create :user, password: "123"
    sign_in_as user

    visit root_url
    click_link "All members"

    select "All", from: "Membership type"
    click_button "Filter"

    assert_selector "p", text: "3 matching members"
    assert_selector "a", text: active_member.name
    assert_selector "a", text: passive_member.name
    assert_selector "a", text: family_member.name
  end
end
