class PagesController < ApplicationController
before_action :authenticate_user!, :except => [:start]
skip_before_action :verify_authenticity_token
    def home
        @users = User.all
        @current_user = current_user
    end
    
    def start
        render layout: false
    end 
    
    def test_page
        @message= params[:id]
        puts @message
        render :test_page
    end
    
    
    def gotit
        @message= params[:id]
        render :update do|page|
        page.replace_html 'show_message', @message
        end
    end
end
