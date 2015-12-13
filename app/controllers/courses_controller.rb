class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user?


  def index
    @courses = Course.all
  end

  def show
  end


  def new
    @course = Course.new
  end


  def edit
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        @message = "Course Was Added Successfully."
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
        format.js
      else
        @message = "Error!, Course Can't be Added."
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end



  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end


    def course_params
      params.require(:course).permit(:name, :course_no)
    end

    def logged_in_user?
      unless current_user.present? #&& is_admin?(current_user)
        redirect_to root_url
      end
    end

end
