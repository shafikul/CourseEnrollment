class SemestersController < ApplicationController
  before_action :set_semester, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user?
  # GET /semesters
  # GET /semesters.json
  def index
    @semesters = Semester.all
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  # POST /semesters
  # POST /semesters.json
  def create
    @semester = Semester.new(semester_params)

    respond_to do |format|
      if @semester.save
        @message = "Semester created successfully."
        format.html { redirect_to @semester, notice: 'Semester was successfully created.' }
        format.json { render :show, status: :created, location: @semester }
        format.js
      else
        @message = "Error! Semester can't be created."
        format.html { render :new }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /semesters/1
  # PATCH/PUT /semesters/1.json
  def update
    respond_to do |format|
      if @semester.update(semester_params)
        format.html { redirect_to @semester, notice: 'Semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @semester }
      else
        format.html { render :edit }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.json
  def destroy
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to semesters_url, notice: 'Semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getCourses
    @user = User.find current_user.id
    @semester = Semester.find params[:id]
    # registered_courses = @user.stores.where({semester_id: params[:id]})
    @courses = @semester.courses
    @registererable_courses = @courses - @user.courses;
    @registered_courses = @user.courses_by_semester params[:id]
  end

  def getSemesterCourses
    @semester = Semester.find params[:id]
    @courses = @semester.courses
    @registered_courses = Course.all - @courses
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id])
    end
    def logged_in_user?
      unless current_user.present? #&& is_admin?(current_user)
        redirect_to root_url
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def semester_params
      params.require(:semester).permit(:name, :semester_type)
    end
end
