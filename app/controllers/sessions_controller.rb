class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # "Create" a session, aka "log the user in"
  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.email}!"
      redirect_to statuses_path
    else
      flash[:alert] = "Please log in again"
      render "new"
    end
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    session.clear
    redirect_to root_url
  end

  private
    # Only allow a trusted parameter "white list" through.
    def session_params
      params.require(:session).permit(:email, :password)
    end
end