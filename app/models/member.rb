class Member < ApplicationRecord
  enum membership_type: {
    active: 0,
    passive: 1,
    family: 2,
    dgi: 3,
    ki_doin: 4,
  }

  validates :first_name, :middle_name, :last_name, presence: true

  def name
    [first_name, middle_name, last_name].join(" ")
  end
end
