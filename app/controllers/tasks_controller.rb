class TasksController < ApplicationController
  before_action :set_task, :change_done, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(group_id: params[:group_id])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @group = Group.find(params[:group_id])
  end

  # GET /tasks/1/edit
  def edit
    @group = Group.find(params[:group_id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.group_id = params[:group_id]
    @task.done = 0 

    respond_to do |format|
      if @task.save
        format.html { redirect_to group_task_path(@task.group_id, @task), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to group_task_path(@task.group_id, @task), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to group_tasks_path(@task.group_id), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_done
    task = Task.find(params[:id])
    task.done = task.done + 1
    task.save
    redirect_to group_tasks_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :start, :finish, :detail, :done)
    end

end
