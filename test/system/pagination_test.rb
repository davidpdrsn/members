require "application_system_test_case"

class PaginationTest < ApplicationSystemTestCase
  test "doesn't show all users by default" do
    count = 20

    (count + 1).times do
      create :member
    end

    user = create :user, password: "123"
    sign_in_as user

    visit root_url
    click_link "All members"

    assert_selector "ul.members-list li", count: count
  end

  test "paginates forwards and backwards" do
    count = 20

    (count + 1).times do
      create :member, membership_type: :active
    end
    create :member, membership_type: :passive

    user = create :user, password: "123"
    sign_in_as user

    visit root_url
    click_link "All members"

    select "Active", from: "Membership type"
    click_button "Filter"

    assert_selector "ul.members-list li", count: count
    assert_selector "a", text: "Next page"
    assert_no_selector "a", text: "Previous page"

    click_link "Next page"

    assert_selector "ul.members-list li", count: 1

    click_link "Previous page"
    assert_no_selector "a", text: "Next page"

    assert_selector "ul.members-list li", count: count
  end
end
