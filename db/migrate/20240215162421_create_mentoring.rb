class CreateMentoring < ActiveRecord::Migration[7.1]
  def change
    create_table :mentorings do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :school_district
      t.string :phone
      t.integer :how_many

      t.timestamps
    end
  end
end
