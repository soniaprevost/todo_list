class WorksController < ApplicationController

  def index
    @works = current_user.works
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id
    if @work.save
      redirect_to works_path
    else
      redirect_to works_path
    end
  end

  def update
    @work = current_user.works.find(params[:id])
    @work.state = true
    if @work.save
      respond_to do |format|
        format.html { works_path }
        format.js
      end
    else
      redirect_to works_path
    end
  end

  def destroy
    @work = current_user.works.find(params[:id])
    @work.destroy

    redirect_to works_path
  end



  private

  def work_params
    params.require(:work).permit(:description, :user_id, :state, :project, :allocated_time)
  end
end
