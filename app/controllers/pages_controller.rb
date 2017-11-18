class PagesController < ApplicationController
    
    def home
        @users = User.all
        @current_user = current_user
    end

end
