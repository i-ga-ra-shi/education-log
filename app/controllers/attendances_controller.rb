class AttendancesController < ApplicationController

    def index
        @attendances = Attendance.all
    end

    def new
        @attendance = Attendance.new
    end

    def show
        @attendance = Attendance.find(params[:id])
    end

    def create
        if Attendance.create(attendance_params)
            redirect_to attendances_path
        else
            render :new
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
        params.require(:attendance).permit(:status, :reason, :start_time)
    end

end
