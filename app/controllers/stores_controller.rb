class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user?
  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def addCourse

    if current_user.present?
     course_id = params[:id]
     course  = Course.find course_id
     semester_id = params[:semester_id]
     user = User.find (current_user.id)
     if user.stores.where({course_id: course_id, semester_id: semester_id }).present?
       @message = "You already registared into this course."
     else
       @stores = user.stores.create({course_id: course_id, semester_id: semester_id })
       @message = "You have Successfully registered in #{course.name} course"
     end
    else
      @message = "You need to log first"
    end

  end

  def updateGPA
    user = User.find_by_email params[:user_id]
    semester_id = Semester.find_by_name params[:semester_id]
    course_id = Course.find_by_name params[:course_id]
    current_store = user.stores.where({course_id: course_id, semester_id: semester_id}).first
    current_store.cgpa = params[:cgpa]
    if current_store.save!
      render json: current_store.to_json
    else
      render json: current_store.errors.full_messages
    end
  end

  def deleteCourse

    if current_user.present?

      course_id = params[:id]
      course  = Course.find course_id
      user = User.find(current_user.id)
      semester_id = params[:semester_id]
      current_store = user.stores.where({course_id: course_id, semester_id: semester_id})
      @row_index = Store.where({user_id: current_user.id, course_id: course_id, semester_id: semester_id})

      @index = @row_index.first.id
      current_store.destroy_all
      @message = "You are unregistared from #{course.name}"

    else
      @message = "Login first"
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end
    def logged_in_user?
      unless current_user.present?
        redirect_to root_url
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:user_id, :semester_id, :course_id, :cgpa)
    end
end
