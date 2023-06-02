class SubjectsController < ApplicationController
    before_action :move_to_index, except: [:index, :show, :search]


    def index
        if params[:latest]
            @subjects = Subject.latest
        elsif params[:old]
            @subjects = Subject.old
        elsif params[:subject_id]
            @subjects = Subject.subject_id
        else
            @subjects = Subject.includes(:user)
        end
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
        keyword_subjects = Subject.search(params[:keyword])
        if params[:latest]
            @subjects = keyword_subjects.latest
        elsif params[:old]
            @subjects = keyword_subjects.old
        elsif params[:subject_id]
            @subjects = keyword_subjects.subject_id
        else
            @subjects = keyword_subjects.includes(:user)
        end
    end

    private
    def subject_params
        params.require(:subject).permit(:subject_id, :title, :name, :content, :file).merge(user_id: current_user.id)
    end

    def move_to_index
        unless user_signed_in?
            redirect_to action: :index
        end
    end

end
