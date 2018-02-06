class MemberFilters
  def initialize(filters:)
    @filters = filters
  end

  def apply_filters(members)
    [
      :apply_membership_type_filter,
      :apply_minimum_age_filter,
    ].reduce(members) do |acc, method|
      send(method, acc)
    end
  end

  private

  def apply_membership_type_filter(members)
    return members unless @filters["membership_type"].present?

    members.where(
      membership_type: @filters.fetch("membership_type")
    )
  end

  def apply_minimum_age_filter(members)
    return members unless @filters["minimum_age"].present?

    minimum_age = @filters.fetch("minimum_age")
    members = members.where(
      "members.date_of_birth > now() - interval '? year'",
      minimum_age.to_i,
    )
  end
end
