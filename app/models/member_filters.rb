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

    members
  end
end
