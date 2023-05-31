class SubjectsController < ApplicationController
    def index
        @subjects = Subject.all
    end

    def new
        @subject = Subject.new
    end

    def create
        @subject = Subject.new(subject_params)
        if @subject.save
            redirect_to(root_path)
        else
            render(:new)
        end
    end

    private
    def subject_params
        params.require(:subject).permit(:subject, :title, :name, :content).merge(user_id: current_user.id)
    end

end
