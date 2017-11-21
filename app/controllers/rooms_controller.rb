class RoomsController < ApplicationController
before_filter :config_opentok,:except => [:index]
def index
@rooms = Room.where(:public => true).order('created_at DESC')
@new_room = Room.new
end

def create
  session = @opentok.create_session
  #params[:room][:sessionId] = session.session_id
  
  print params
  
  @new_room = Room.new()
  @new_room.name = params[:room][:name]
  @new_room.sessionId = session.session_id
  @new_room.public = params[:room][:public]
  
  respond_to do |format|
    if @new_room.save
      format.html { redirect_to('/party/'+@new_room.id.to_s) }
    else
      format.html { render :controller => ‘rooms’,
      :action => 'index' }
    end
  end
end

def party
  @room = Room.find(params[:id])
  @tok_token = @opentok.generate_token @room.sessionId 
end

def del
  @room_del = Room.find(params[:id])
  @room_del.destroy
end

def destroy
  @room_del = Room.find(params[:id])
  @room_del.destroy
  redirect_to root_path
end

private
  def config_opentok
    if @opentok.nil?
      @opentok =  OpenTok::OpenTok.new '46003472', '2c45b69a342de7d9c7ebedba2ff1d1d69f3bcfeb'
    end
  end
end
