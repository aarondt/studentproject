class AddUserIdToRooms < ActiveRecord::Migration
  def change
     add_column :rooms, :user_id, :integer
     add_column :rooms, :session_duration, :float
  end
end
