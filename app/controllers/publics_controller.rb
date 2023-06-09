class PublicsController < ApplicationController

    def index
        @subjects = Subject.where(id: Public.pluck(:subject_id))
        if params[:subject_name]
            @subjects = Subject.subject_name(params[:subject_name])
            if params[:latest]
                @subjects = @subjects.latest
            elsif params[:old]
                @subjects = @subjects.old
            elsif params[:subject_id]
                @subjects = @subjects.subject_id
            elsif params[:month_id]
                @subjects = @subjects.month_id
            elsif params[:student_id]
                @subjects = @subjects.student_id
            end
        elsif params[:latest]
            @subjects = Subject.latest
        elsif params[:old]
            @subjects = Subject.old
        elsif params[:subject_id]
            @subjects = Subject.subject_id
        elsif params[:month_id]
            @subjects = Subject.month_id
        elsif params[:student_id]
            @subjects = Subject.student_id
        else
            @subjects = Subject.includes(:user)
        end
    end

    def create
        @public = Public.new(public_params)
        @public.save
    end

    def destroy
        Public.find(params[:id]).destroy
    end

    private
    def public_params
        params.permit(:user_id, :subject_id)
    end
end
