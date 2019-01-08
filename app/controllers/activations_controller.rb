class ActivationsController < ApplicationController
    #before_filter :require_no_user, :only => [:new, :create]

    def new
      @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
      raise Exception if @user.active?
    end
    
    def create
        @user = User.find(params[:id])

        raise Exception if @user.active?

        if @user.activate!(params)
          
          # set user as an author on user activation
          role = Role.find(:first, :conditions => ["name = ?", "author"])
          
          @role_assign = Assignment.new(:user_id => @user.id, :role_id => role.id)
          @role_assign.save
          
          
          
          
          UserMailer.activation_confirmation(@user).deliver
          
          flash[:notice] = "Your account has been activated."
          redirect_to root_url
        else
          render :action => :new
        end
      end
    
 
  end