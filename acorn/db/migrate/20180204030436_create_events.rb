class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.datetime :start_at
      t.datetime :end_at
      t.text :description
      t.string :facebook_url
      t.integer :cover_image_id
      t.integer :event_type_id
      t.integer :member_id
      t.timestamps
    end

    create_table :event_types do |t|
      t.string :title
      t.timestamps
    end

    add_index :events, :event_type_id
    add_index :events, :member_id
  end
end
