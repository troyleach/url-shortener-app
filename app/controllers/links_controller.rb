class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def create
  
    @link = Link.new({:user_id => current_user.id, :slug => params[:slug], :target_url => params[:target_url]})
    @link.standardize_target_url!
    

    if @link.save
      flash[:success] = "this worked"
      redirect_to links_path
    else
      flash[:message] = "Something was wrong with your form"
      render "new"
    end
  end

  def show
    @link = Link.find_by(:id => params[:id])
  end

  def new
    @link = Link.new
  end
end
