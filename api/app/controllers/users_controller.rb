class UsersController < ApplicationController

    before_action :session_expired?, only: [:check_login_status]

    def register
        user = User.create(user_params)
        if user.valid?
            save_user(user.id)
            app_response(message: 'Registration was successful',
            status: :created, data: user)
            # render :json {
            #     message: 'Registration was successful',
            #     data: user
            # }, status: :created

            else
                app_response(message: 'Something went wrong during registration',
                status: :created)
                # render :json {
                #     message: 'SOmething went wrong during registration'
                # }, status: :unprocessable_entity
            end

    end

    def login
        sql = "username = :username OR email = :email"
        user = User.where(sql, {username: user_params[:username], email: user_params[:email]}).first
        if user&.authenticate(user_params[:password])
            save_user(user.id)
            app_response(message: 'Login was successful', status: :ok, data: user)
        else
            app_response(message: 'Invalid username/email or password', status: :unauthorized)
        end


    end


    def logout
        remove_user
        app_response(message: 'Logged out', status: :ok)

    end


    def check_login_status
        app_response(message: 'success', status: :ok )

    end



    private
    def user_params
        params.permit(:username, :email, :password)

    end



end
