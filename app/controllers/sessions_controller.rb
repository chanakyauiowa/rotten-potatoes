
class SessionsController < ApplicationController
def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
end    
    def new
    end
    
    def create
      m = params[:user][:user_id]
      n = params[:user][:email]
      @user = User.find_by(user_id: m)
      if     ( !(@user == nil) and (@user.email == n) )
            session[:session_token] = @user.session_token
            session[:notice]="You are logged in as #{@user.user_id}"
            redirect_to movies_path
      else
            flash[:notice]="Invalid user-id/e-mail combination"
            redirect_to login_path
      end
    end
    
    
    def destroy
        session[:session_token] = nil
        session[:notice] = nil
        redirect_to movies_path
    end
    
end