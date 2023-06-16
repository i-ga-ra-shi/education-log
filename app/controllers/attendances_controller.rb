class AttendancesController < ApplicationController

    def show
        @attendance = Attendance.find(params[:id])
    end

    def create
        if Attendance.create(attendance_params)
            flash[:notice] = "登録しました"
            redirect_to user_path(params[:user_id])
        else
            flash[:notice] = "全ての欄を入力してください"
            render user_path(params[:id])
        end
    end

    def destroy
        @attendance = Attendance.find(params[:user_id])
        @attendance.destroy
        redirect_to attendances_path, notice:"削除しました"
    end

    def edit
        @attendance = Attendance.find(params[:id])
    end

    def update
        @attendance = Attendance.find(params[:id])
        if @attendance.update(attendance_params)
            redirect_to attendances_path, notice: "編集しました"
        else
            render :edit
        end
    end

    private

    def attendance_params
        params.permit(:name, :status, :reason, :start_time, :student_id).merge(user_id: params[:user_id])
    end

end
