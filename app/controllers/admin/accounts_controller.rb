class AccountsController < ApplicationController
  before_action :login_required

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attributes(params[:account])
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end
end

private def account_params
  params.require(:account).permit(
    :number,
    :name,
    :full_name,
    :gender,
    :birthday,
    :email
  )
end

