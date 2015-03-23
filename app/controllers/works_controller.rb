class WorksController < ApplicationController

  def index
    @works = current_user.works
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id

    if @work.save
      flash[:notice] = "Task created"

      redirect_to works_path
    else
      flash[:alert] = "unable to create task"

      render 'index'
    end
  end

  private

  def work_params
    params.require(:work).permit(:description, :user_id)
  end
end
