class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  
  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @user }
    #end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    User.transaction do
      if @user.save
        #UserMailer.registration_confirmation(@user,'https://floating-sky.herokuapp.com').deliver
  
        if @user.subscription?
          Subscriber.find_or_create_by_name_and_email(@user.name,@user.email)
        end
  
        sign_in @user
        
        flash[:success] = "Welcome to Application X!"
        redirect_to @user
      else
        render 'new'
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
#  def destroy
#    @user = User.find(params[:id])
#    @user.destroy

#    respond_to do |format|
#      format.html { redirect_to users_url }
#      format.json { head :no_content }
#    end
#  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end  
  
  
  private

    def signed_in_user
      #flash[:notice] = "Please sign in."
      #redirect_to signin_path
      store_location
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end  

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end  
  
end
