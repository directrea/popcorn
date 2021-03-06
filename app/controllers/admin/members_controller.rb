class Admin::MembersController < Admin::Base
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
            redirect_to [:admin,@member], notice: "会員登録しました。"
        else
            render "new"
        end
    end

    def update
        @member = Member.find(params[:id])
        @member.assign_attributes(params[:member])
        if @member.save
            redirect_to [:admin,@member], notice: "会員情報を更新しました。"
        else
            render "edit"
        end
    end

    def destroy
        @member = Member.find(params[:id])
        @member.destroy
        redirect_to :admin_members, notice: "会員名：#{@member.user_name}を削除しました。"
    end
end
