class JobsController < ApplicationController
  def index
    if params[:sort]
      @jobs = Job.sort(params[:sort])
    elsif params[:location]
      @jobs = Job.by_city(params[:location])
    elsif params[:controller] == 'jobs'
      @jobs = Job.all
    else
      @jobs = Job.company_jobs_index
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @job     = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job     = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job     = Job.find(params[:id])
    @job.update(job_params)
    redirect_to company_job_path(@company, @job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to company_path(@job.company)
  end
  
  def dashboard
    @job_level_count = Job.level_count
    @top_companies   = Company.top_three_companies
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
