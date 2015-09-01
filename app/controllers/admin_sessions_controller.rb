class AdminSessionsController < ApplicationController
	def new
		admin = Admin.find_by(username: params[:admin_session][:username])
		if admin && admin.authenticate(params[:dmin_session][:password])
			admin_sign_in admin
			redirect_to admin
		else
	    flash[:error] = 'Invalid username/password combination' # Not quite right! 
	    render 'new'
	  end
  end


  def create
  	render 'new'
  end

  def destroy
  	admin_sign_out
    redirect_to root_path
  end
end
