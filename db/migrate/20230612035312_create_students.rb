class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.integer :grade, null:false
      t.integer :class_number, null:false
      t.integer :number, null:false
      t.string  :name, null:false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
