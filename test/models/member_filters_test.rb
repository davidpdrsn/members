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

  test "filtering on age" do
    Timecop.freeze(Time.zone.now) do
      child = create :member, first_name: "child", date_of_birth: 15.years.ago
      youngster = create :member, first_name: "youngster", date_of_birth: 24.years.ago
      adult = create :member, first_name: "adult", date_of_birth: 26.years.ago

      matching_members = MemberFilters
        .new(filters: { "minimum_age" => "25" })
        .apply_filters(Member.all)

      assert_equal(
        [child, youngster].map(&:first_name).sort,
        matching_members.map(&:first_name).sort,
      )
    end
  end
end
