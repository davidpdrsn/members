class Payment < ApplicationRecord
  belongs_to :member

  enum status: {
    pending: 0,
    payed: 1,
  }

  class << self
    def create_pending_payment_for_all_members
      transaction do
        Member.all.find_each(&:create_pending_payment)
      end
    end
  end
end
