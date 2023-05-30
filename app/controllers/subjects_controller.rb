class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
  end
end
