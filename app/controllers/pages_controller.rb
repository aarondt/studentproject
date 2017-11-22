class PagesController < ApplicationController
before_action :authenticate_user!, :except => [:start]

    def home
        @users = User.all
        @current_user = current_user
    end
    
    def start
        render layout: false
    end 
end
