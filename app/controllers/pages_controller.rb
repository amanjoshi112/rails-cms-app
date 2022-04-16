class PagesController < ApplicationController
  
  def index
    @pages= Page.all
    @page = Page.find_by_slug("home")
  end

  def show
    @pages= Page.all
    @page = Page.find_by_slug(params[:slug])
  end

  def to_param
      #return the string of the slug stored in our database
      self.slug
    end

end
