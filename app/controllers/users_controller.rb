class UsersController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy


  def index
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end

  def show
  	@user = User.find(params[:id])
     @microposts = @user.microposts.paginate(:page => params[:page])
  	@title = @user.name
  end

  def new
  	@title = "Sign up"
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      sign_in @user
  		redirect_to @user, :flash => { :success =>"Welcome to Westeros! You'll definitely die" }
  	else 
	  	@title = "Sign up"
	  	render 'new'
    end
  end

  def edit

    @title = "Edit profile"
  end

  def update

    @title = "Edit profile"

    if @user.update_attributes(params.require(:user).permit(:name, :email, :password))
      redirect_to @user, :flash => { :success => "Profile updated" }
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :flash => {:success => "The user has been completely destroyed. Forever. And ever."}
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :submitted_password)
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end