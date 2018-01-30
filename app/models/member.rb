class Member < ApplicationRecord
  enum membership_type: {
    active: 0,
    inactive: 1,
  }

  def name
    [first_name, middle_name, last_name].join(" ")
  end
end
