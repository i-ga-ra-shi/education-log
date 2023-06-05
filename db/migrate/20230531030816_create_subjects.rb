class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.integer :subject_id, null: false
      t.string :sub_subject
      t.string :title, null: false
      t.integer :month_id, null: false
      t.integer :student_id, null:false
      t.string :name, null: false
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps     
    end
  end
end
