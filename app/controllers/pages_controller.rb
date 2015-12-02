class PagesController < ApplicationController
  def Index
  end

  def Home
  end

  def Profile
    @email = params[:id]
  end

  def Explore
  end
end
