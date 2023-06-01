class SubjectsController < ApplicationController
    before_action :move_to_index, except: [:index, :show, :search]


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

    def search
        @subjects = Subject.search(params[:keyword])
    end

    private
    def subject_params
        params.require(:subject).permit(:subject_id, :title, :name, :content).merge(user_id: current_user.id)
    end

    def move_to_index
        unless user_signed_in?
            redirect_to action: :index
        end
    end

end
