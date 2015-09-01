class AdminsController < ApplicationController
	before_action :signed_in_admin, only: [:edit, :update, :delete]

	def new
		@admin = Admin.new
	end

	def show
		@admin = Admin.find(params[:id])
	end

	def index
		@admins = Admin.all
	end

	def edit
		@admin = Admin.find(params[:id])
	end

	def create
		@admin = Admin.new(admin_params)
		if @admin.save
			flash[:success] = "New Admin Added!"
			redirect_to current_admin
		else
			render 'new'
		end 
	end

	def update
		@admin = Admin.find(params[:id])
		if @admin.update_attributes(admin_params)
			flash[:success] = "Profile updated"
			admin_sign_in @admin
			redirect_to @admin
		else
			render 'edit'
		end 
	end

	private
	def admin_params
		params.require(:admin).permit(:username, :email, :password, :password_confirmation)
	end

	def correct_admin
		@admin = Admin.find(params[:id])
		redirect_to(root_path) unless current_admin?(@admin)
	end

	def signed_in_admin
		unless admin_signed_in?
			store_location
			redirect_to admin_signin_url, notice: "Please sign in."
		end
	end
end

