class AddEventToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :event, null: false, foreign_key: true
  end
end
