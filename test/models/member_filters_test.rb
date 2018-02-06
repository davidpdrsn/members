require "test_helper"

class MemberFiltersTest < ActiveSupport::TestCase
  test "filters on membership types" do
    active_member = create :member, membership_type: :active
    passive_member = create :member, membership_type: :passive
    family_member = create :member, membership_type: :family

    [
      active_member,
      passive_member,
      family_member,
    ].each do |member|
      matching_members = MemberFilters
        .new(filters: { "membership_type" => member.membership_type })
        .apply_filters(Member.all)

      assert_equal(
        [member.name],
        matching_members.map(&:name),
      )
    end
  end

  test "filtering without membership type" do
    active_member = create :member, membership_type: :active
    passive_member = create :member, membership_type: :passive
    family_member = create :member, membership_type: :family

    matching_members = MemberFilters
      .new(filters: { "membership_type" => "" })
      .apply_filters(Member.all)

    assert_equal(
      [
        active_member,
        passive_member,
        family_member
      ].map(&:name).sort,
      matching_members.map(&:name).sort,
    )
  end
end
