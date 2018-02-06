class MemberFilters
  def initialize(filters:)
    @filters = filters
  end

  def apply_filters(members)
    if @filters["membership_type"].present?
      members = members.where(
        membership_type: @filters.fetch("membership_type")
      )
    end

    if @filters["minimum_age"].present?
      minimum_age = @filters.fetch("minimum_age")

      members = members.where(
        "members.date_of_birth > now() - interval '? year'",
        minimum_age.to_i,
      )
    end

    members
  end
end
