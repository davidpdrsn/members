class MembersController < ApplicationController
  def index
    @members = Member.all

    if params[:filters].present?
      @members = apply_filters(@members)
    end

    @members = PaginatedRelation.new(
      relation: @members,
      per_page: 20,
    ).page(params[:page].try(:to_i) || 0)
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
      flash.alert = "Something went wrong"
      render :new
    end
  end

  private

  def apply_filters(members)
    MemberFilters
      .new(filters: params.fetch(:filters))
      .apply_filters(members)
  end
end
