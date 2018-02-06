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

  test "filtering on age" do
    child = create :member, first_name: "child", date_of_birth: 14.years.ago
    youngster = create :member, first_name: "youngster", date_of_birth: 24.years.ago
    adult = create :member, first_name: "adult", date_of_birth: 26.years.ago

    user = create :user, password: "123"
    sign_in_as user

    visit root_url
    click_link "All members"

    select "25", from: "Minimum age"
    click_button "Filter"

    assert_selector "p", text: "2 matching members"
    assert_selector "a", text: child.name
    assert_selector "a", text: youngster.name
    assert_no_selector "a", text: adult.name
  end

  test "compound filters" do
    active_child = create :member, first_name: "active child", date_of_birth: 14.years.ago, membership_type: :active
    passive_child = create :member, first_name: "passive child", date_of_birth: 14.years.ago, membership_type: :passive
    youngster = create :member, first_name: "youngster", date_of_birth: 24.years.ago, membership_type: :active

    user = create :user, password: "123"
    sign_in_as user

    visit root_url
    click_link "All members"

    select "15", from: "Minimum age"
    select "Active", from: "Membership type"
    click_button "Filter"

    assert_selector "p", text: "1 matching member"
    assert_selector "a", text: active_child.name
    assert_no_selector "a", text: passive_child.name
    assert_no_selector "a", text: youngster.name
  end
end
