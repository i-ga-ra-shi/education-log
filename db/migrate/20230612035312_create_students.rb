class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.integer :grade
      t.integer :class_number
      t.integer :number
      t.string  :name
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
