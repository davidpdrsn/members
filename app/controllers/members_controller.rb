class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    member_params = params.require(:member).permit(
      :first_name,
      :middle_name,
      :last_name,
      :date_of_birth,
      :membership_type,
    )

    @member = Member.new(member_params)

    if @member.save
      flash.notice = "Member created"
      redirect_to @member
    else
      raise "TODO"
    end
  end
end
