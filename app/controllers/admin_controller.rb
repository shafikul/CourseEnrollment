class AdminController < ApplicationController
  def index
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
end
