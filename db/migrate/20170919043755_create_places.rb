class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|

    	t.string :acronym
    	t.string :name
    	t.string :address
    	t.string :phone
    	t.string :latitude
    	t.string :longitude
    	t.string :email

      t.timestamps
    end
  end
end
