class UsersController < ApplicationController
   
   def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
   end
   
    def new
    end
   
    def create
        user_params
        m = params[:user][:user_id]
        if ((User.find_by(user_id: m)) == nil)
            @user = User.create_user!(user_params)
            print "session #{params[:user][:session_token]}"
            flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
            redirect_to login_path
        else
            flash[:notice] = "Sorry this user id is taken. Try again."
            redirect_to new_user_path
        end
    end   
end    