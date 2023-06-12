class StudentsController < ApplicationController
    def index
        @students = Student.where(user_id: current_user.id)
    end
end
