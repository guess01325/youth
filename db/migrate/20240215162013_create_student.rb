class CreateStudent < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.integer :contact
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
