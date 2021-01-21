class MembersController < ApplicationController
    def index
        @members = Member.all
    end

    def new
        @member = Member.new(birthday: Date.new(1980, 1, 1))
    end

    def edit
        @member = Member.find(params[:id])
    end

    def show
        @member = Member.find(params[:id])
    end

    def create
        @member = Member.new(params[:member])
        if @member.save
            session[:member_id] = @member.id
            redirect_to account_path, notice: "会員登録しました。"
        else
            render "new"
        end
    end

    def destroy
        @member = Member.find(params[:id])
        @member.destroy
        redirect_to :members, notice: "会員名：#{@member.user_name}を削除しました。"
    end
end
