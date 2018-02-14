class UpdatesPaymentStatuses
  def initialize(payed_payment_params:)
    @payed_payment_params = payed_payment_params
      .to_unsafe_hash
      .transform_keys(&:to_i)
  end

  def update_payments
    payments.each do |payment|
      update_payment(payment)
    end
  end

  def payments
    @payments ||= Payment.find(@payed_payment_params.keys)
  end

  private

  def update_payment(payment)
    status_param = @payed_payment_params.fetch(payment.id)

    if status_param == "1"
      payment.payed!
    else
      raise "TODO"
    end
  end
end
