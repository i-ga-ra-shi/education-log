class AttendancesController < ApplicationController

    def index
        @attendances = Attendance.all
    end

    def show
        @attendance = Attendance.find(params[:id])
    end

    def create
        binding.pry
        if Attendance.create(attendance_params)
            flash[:notice] = "登録しました"
            redirect_to attendances_path
        else
            flash[:notice] = "全ての欄を入力してください"
            render :index
        end
    end

    def destroy
        @attendance = Attendance.find(params[:id])
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
        params.permit(:name, :status, :reason, :start_time, :student_id, :user_id)
    end

end
