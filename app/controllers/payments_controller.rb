class PaymentsController < ApplicationController
  def index
    @pending_payments = Payment.pending
    @payed_payments = Payment.payed
  end

  def create
    Payment.create_pending_payment_for_all_members

    redirect_to(
      payments_path,
      notice: "Created #{Member.count} payments",
    )
  end

  def update_statuses
    params[:payments].each do |id, value|
      payment = Payment.find(id)

      if value == "1"
        payment.update!(status: :payed)
      else
        raise "TODO"
      end
    end

    redirect_to(
      payments_path,
      notice: "Updated #{params[:payments].keys.length} payments",
    )
  end
end
