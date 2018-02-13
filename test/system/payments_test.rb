require "application_system_test_case"

class PaymentsTest < ApplicationSystemTestCase
  test "creating payments for all members" do
    5.times do
      create :member, membership_type: :active
    end

    user = create :user, password: "123"
    sign_in_as user

    visit root_url
    click_link "Payments"
    click_link "Create pending payments for all members"

    assert_selector(
      "div.pending-payments ul li.pending-payment",
      count: Member.count,
    )

    check Member.first.name
    check Member.second.name
    click_button "Save payment statuses"

    assert_selector(
      "div.pending-payments ul li.pending-payment",
      count: 3,
    )

    assert_selector(
      "div.payed-payments ul li.payed-payment",
      count: 2,
    )
  end
end
