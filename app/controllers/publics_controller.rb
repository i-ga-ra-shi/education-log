class PublicsController < ApplicationController

    def index
        @subjects = Subject.where(id: Public.pluck(:subject_id))
    end

    def create
        @public = Public.new(public_params)
        if @public.save
            redirect_to(subjects_path)
        else
            render(subjects_path)
        end
    end

    def destroy
        if Public.find(params[:id]).destroy
            redirect_to(subjects_path)
        else
            render(subjects_path)
        end
    end

    private
    def public_params
        params.permit(:user_id, :subject_id)
    end
end
