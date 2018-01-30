require "test_helper"

class MemberTest < ActiveSupport::TestCase
  test "#name" do
    member = Member.create!(
      first_name: "Bob",
      middle_name: "Hansen",
      last_name: "Larsen",
      date_of_birth: Date.today,
      membership_type: :active,
    )

    assert_equal "Bob Hansen Larsen", member.name
  end
end
