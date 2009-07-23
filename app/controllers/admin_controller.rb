class AdminController < ApplicationController
  layout 'backend'
  def login
    if request.post? 
      user = User.authenticate(params[:nick_name], params[:password]) 
      if user
        session[:user_id] = user.id
        redirect_to(:action => 'index')
      else
        flash.now[:notice] = "Invalid nickname or password"
      end
    end
  end


  def logout
    session[:user_id] = nil 
    flash[:notice] = "Logged out" 
    redirect_to(:action => "login")
  end

  def index
    @products = Product.all
  end

end
