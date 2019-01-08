class UsersController < ApplicationController
    filter_resource_access
    def new
      @user = User.new
    end
    
    def create
        @user = User.new

        @user.username = params[:user][:username]
        @user.email = params[:user][:email]

        puts @user

        if @user.save
            puts "hello"
          UserMailer.activation_instructions(@user).deliver
          
          flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
          redirect_to root_url
        else
          render :action => :new
        end
      end
    
    def edit
      @page_title = "Edit User"
      @user = current_user
      
    end
    
    def update
      @user = current_user
      if @user.update_attributes(params[:user])
        flash[:notice] = "Successfully updated profile."
        redirect_to root_url
      else
        render :action => 'edit'
      end
    end
  end