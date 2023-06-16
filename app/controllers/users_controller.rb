class UsersController < ApplicationController
    
    def index

    end

    def check
        user = User.find_by(id: params[:user_id])
        if user.nil?
            flash[:notice] = "存在しない学校idです"
            render :index
        elsif user.email == params[:email]
            redirect_to user_path(params[:user_id])
        else
            flash[:notice] = "学校idとメールアドレスが一致しません"
            render :index
        end
    end
    
    def show
        @attendances = Attendance.where(user_id: params[:id])
    end
end
