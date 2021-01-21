class AccountsController < ApplicationController
  before_action :login_required, except: [:new,:create]

  layout 'reservations.html.erb'

  def new
    @member = Member.new()
  end

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      session[:member_id] = @member.id
      redirect_to account_path, notice: "会員登録しました"
    end
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

  def destroy
    @member = current_member.destroy
    session.delete(:member_id)
    redirect_to "/", notice: "会員を削除しました。"
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

