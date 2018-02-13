class Payment < ApplicationRecord
  belongs_to :member

  enum status: {
    pending: 0,
    payed: 1,
  }
end
