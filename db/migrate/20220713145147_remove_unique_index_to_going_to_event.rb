class RemoveUniqueIndexToGoingToEvent < ActiveRecord::Migration[7.0]
  def change
    remove_index :going_to_events, name: "index_going_to_events_on_user_and_event", unique: true
  end
end
