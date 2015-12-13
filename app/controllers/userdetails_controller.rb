class UserdetailsController < ApplicationController
  before_action :set_userdetail, only: [:show, :edit, :update, :destroy]

  # GET /userdetails
  # GET /userdetails.json

  # GET /userdetails/1
  # GET /userdetails/1.json
  def show
  end

  # GET /userdetails/new
  def new
    @user = User.find params[:user_id]
    @userdetail = @user.build_userdetail
  end

  # GET /userdetails/1/edit
  def edit
    @user = User.find params[:user_id]
    @userdetail = @user.userdetail
  end

  # POST /userdetails
  # POST /userdetails.json
  def create
    @user = User.find params[:user_id]
    if @user.present?
      @userdetail = @user.Userdetail.new(userdetail_params)

      respond_to do |format|
        if @userdetail.save
          format.html { redirect_to @userdetail, notice: 'Userdetail was successfully created.' }
          format.json { render :show, status: :created, location: @userdetail }
        else
          format.html { render :new }
          format.json { render json: @userdetail.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "User not found"
      render 'new'
    end

  end

  # PATCH/PUT /userdetails/1
  # PATCH/PUT /userdetails/1.json
  def update
    @user = User.find (current_user.id)
    @userdetail = @user.userdetail
    if @userdetail.update(userdetail_params)
         render 'show'
    end
  end

  # DELETE /userdetails/1
  # DELETE /userdetails/1.json
  def destroy
    @userdetail.destroy
    respond_to do |format|
      format.html { redirect_to userdetails_url, notice: 'Userdetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userdetail
      @user = User.find(params[:user_id])
      @userdetail = @user.userdetail
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userdetail_params
      params.require(:userdetail).permit(:user_id, :line1, :line2, :city, :state, :zip, :country, :contact_no)
    end
end
