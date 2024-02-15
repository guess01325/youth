class CreateRegistration < ActiveRecord::Migration[7.1]
  def change
    create_table :registrations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :how_often

      t.timestamps
    end
  end
end
