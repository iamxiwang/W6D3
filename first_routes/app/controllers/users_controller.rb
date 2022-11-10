
class UsersController < ApplicationController 

    def index 
        users = User.all 
        render json: users
    end 

    def create 
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else 
            render json: user.errors.full_messages, status: 422
        end 
    end 

    def show 
        user = User.find_by(id: params[:id])
        if user
            render json: user
        else
            redirect_to users_url
        end
        
    end 

    def update
        user = User.find_by(id: params[:id])

        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.dele
        redirect_to user_url
       

    end



    private

    def user_params
        params.require(:user).permit(:name,:email)
    end
end 