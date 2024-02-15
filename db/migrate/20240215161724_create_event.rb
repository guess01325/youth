class CreateEvent < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.string :date
      t.string :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
