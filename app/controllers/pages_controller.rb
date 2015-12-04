class PagesController < ApplicationController

  def Index
    if(params[:keyword].present?)
      @courses = Course.find_by_course_no(params[:keyword])
      if(@courses.present?)
        @stores = @courses.stores
      else
        @stores = Store.all
      end
    else
      @stores = Store.all
    end
  end

  def Home
    @user = User.find current_user.id
    @stores = @user.stores
    @passedCourse = @stores.where("cgpa >= ?", 2.0 )
  end

  def Profile
    @email = params[:id]
  end

  def Explore
  end
end
