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
    updates = UpdatesPaymentStatuses.new(
      payed_payment_params: params[:payments],
    )

    updates.update_payments

    redirect_to(
      payments_path,
      notice: "Updated #{updates.payments.size} payments",
    )
  end
end
