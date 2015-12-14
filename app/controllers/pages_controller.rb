class PagesController < ApplicationController

  def index

    if(params[:keyword].present?)
      @courses = Course.find_by_course_no(params[:keyword])

      if(@courses.present?)
        @stores = @courses.stores
      elsif User.find_by_email(params[:keyword]).present?
        @stores = User.find_by_email(params[:keyword]).stores
      else
        @stores = Store.all
      end
    else
      @stores = Store.all
    end

    if current_user.present?

      @courseoffer = CourseOffer.all
      @user = User.find current_user.id
      @passedCourse = @user.stores.where("cgpa >= ?", 2.0 )
      @registercourse = @user.stores.where(:cgpa => nil)
    end

  end

  def home
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  def profile

    if current_user.present?
      @user = User.find current_user.id
      if @user.userdetail.present?
        @userdetail = current_user.userdetail
      else
        @userdetail = Userdetail.create({user_id: @user.id})
      end
    else
      redirect_to root_url
    end
  end

  def explore
  end

  def search_by_keyword
    params[:keyword]
  end

end