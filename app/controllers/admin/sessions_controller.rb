class SessionsController < ApplicationController
    def create
        member = Member.find_by(user_name: params[:user_name])
        if member&.authenticate(params[:password])
            session[:member_id] = member.id
        else
            flash.alert = "名前とパスワードが一致しません"
        end
        redirect_to "/"
    end

    def destroy
        session.delete(:member_id)
        redirect_to "/"
    end
end
