class ProfilesController < ApplicationController
    
    def new
        #checkt ob der eingeloggte user schon ein profil hat, dann soll er kein neues erstellen können
        if current_user.profile.nil?
            @profile = Profile.new
        else
            flash[:notice] = "Du hast bereits ein Profil!"
            redirect_to profile_path(current_user.id)
        end 
    end
    
    def create
       @profile = Profile.new(profile_params)
       @profile.user_id = current_user.id
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
        @profile = Profile.find(current_user.profile.id)
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
