class CreateGoingToEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :going_to_events do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
