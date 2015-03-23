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

  def update
    @work = current_user.works.find(params[:id])
    @work.state = true
    if @work.save
      flash[:notice] = "Task updated"
      redirect_to works_path
    else
      flash[:alert] = "unable to update task"
      render "index"
    end
  end

  def destroy
    @work = current_user.works.find(params[:id])

    @work.destroy

    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:description, :user_id, :state)
  end
end
