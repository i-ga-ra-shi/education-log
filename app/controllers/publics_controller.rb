class PublicsController < ApplicationController

    def index
        @subjects = Subject.where(id: Public.pluck(:subject_id))
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
