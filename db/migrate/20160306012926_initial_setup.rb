class InitialSetup < ActiveRecord::Migration
  def change
  	create_table :stops do |t|
  	  t.string 	:name,            null: false
  		t.string 	:location,        null: false
  		t.text 		:description,     null: false
  		t.string	:website,         null: false
  		t.boolean	:featured,        default: false
  		t.string	:featured_image,  null: false
  		t.timestamps null: false
  	end

	 create_table :events do |t|
  		t.string 	:name,            null: false
  		t.string 	:location,        null: false
  		t.text 		:description,     null: false
  		t.string	:website,         null: false
  		t.string	:featured_image,  null: false
  		t.date		:start_date,      null: false
  		t.date 		:end_date,        null: false
  		t.timestamps null: false
  	end

    create_table :categories do |t|
      t.string  :name,            null: false,  unique: true
      t.text    :description,     null: false
      t.string  :icon
    end

    create_table :tags do |t|
      t.string  :name,            null: false,  unique: true
    end

    create_table :categories_stops, id: false do |t|
      t.belongs_to :category,  null: false
      t.belongs_to :stop,      null: false
      t.index [:category_id, :stop_id], unique: true
    end

    create_table :categories_tags, id: false do |t|
      t.belongs_to :category, null: false
      t.belongs_to :tag,     null: false
      t.index [:category_id, :tag_id], unique: true
    end

    create_table :events_categories, id: false do |t|
      t.belongs_to :event,     null: false
      t.belongs_to :category,  null: false
      t.index  [:event_id, :category_id], unique: true
    end

    create_table :events_tags, id: false do |t|
      t.belongs_to :event,     null: false
      t.belongs_to :tag,       null: false
      t.index [:event_id, :tag_id], unique: true
    end
  end
end
