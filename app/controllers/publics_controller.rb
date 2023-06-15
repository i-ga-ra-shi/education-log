class PublicsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    def index
        @subjects = Subject.where(id: Public.pluck(:subject_id))
        if params[:subject_name]
            @subjects = @subjects.subject_name(params[:subject_name])
            if params[:latest]
                @subjects = @subjects.latest
            elsif params[:old]
                @subjects = @subjects.old
            elsif params[:subject_id]
                @subjects = @subjects.subject_id
            elsif params[:month_id]
                @subjects = @subjects.month_id
            elsif params[:grade_id]
                @subjects = @subjects.grade_id
            end
        elsif params[:latest]
            @subjects = @subjects.latest
        elsif params[:old]
            @subjects = @subjects.old
        elsif params[:subject_id]
            @subjects = @subjects.subject_id
        elsif params[:month_id]
            @subjects = @subjects.month_id
        elsif params[:grade_id]
            @subjects = @subjects.grade_id
        else
            @subjects = @subjects.includes(:user)
        end
    end

    def create
        @public = Public.new(public_params)
        @public.save
    end

    def destroy
        Public.find(params[:id]).destroy
    end

    def search
        keyword_subjects = Subject.search(params[:keyword])
        if params[:latest]
            @subjects = keyword_subjects.latest
        elsif params[:old]
            @subjects = keyword_subjects.old
        elsif params[:subject_id]
            @subjects = keyword_subjects.subject_id
        elsif params[:month_id]
            @subjects = keyword_subjects.month_id
        elsif params[:grade_id]
            @subjects = keyword_subjects.grade_id
        else
            @subjects = keyword_subjects.includes(:user)
        end
    end
    
    private
    def public_params
        params.permit(:user_id, :subject_id)
    end
end
