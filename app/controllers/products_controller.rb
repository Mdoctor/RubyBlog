
class ProductsController < ApplicationController
	before_action :authenticate_user!
	  def show
		  # @posts = Post.paginate(:page => params[:page], :per_page => 30)
	  end

	  def myshow
		  render "show"
	  end

	  def allscored
		  render "show"
	  end
	end	
