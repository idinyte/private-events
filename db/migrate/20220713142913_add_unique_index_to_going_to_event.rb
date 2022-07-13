class AddUniqueIndexToGoingToEvent < ActiveRecord::Migration[7.0]
  def change
    add_index :going_to_events, [:user, :event], unique: true
  end
end
