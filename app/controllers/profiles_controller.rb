class ProfilesController < ApplicationController
    
    def new
        @profile = Profile.new
    end
    
    def create
       @profile = Profile.new(profile_params)
        if @profile.save
            flash[:notice] = "Dein Profil wurde aktualisiert"
            #@profile.save
            redirect_to profile_path(@profile)
        else
            render 'new'
        end
    end
    
    def show
        @profile = Profile.find(params[:id])
    
    end
    
    def edit
        @profile = Profile.find(params[:id])
    end 
    
    def update
        @profile = Profile.find(params[:id])
        if @profile.update(profile_params)
            flash[:notice] = "Dein Profil wurde aktualisiert"
            redirect_to profile_path(@profile)
        else
            render 'edit'
        end
        
    end 
    
    private
        def profile_params
         params.require(:profile).permit(:name, :bio, :specialization)
        end


end
