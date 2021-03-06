require "test_helper"

class MemberTest < ActiveSupport::TestCase
  test "#name" do
    member = build(
      :member,
      first_name: "Bob",
      middle_name: "Hansen",
      last_name: "Larsen",
    )

    assert_equal "Bob Hansen Larsen", member.name
  end
end
