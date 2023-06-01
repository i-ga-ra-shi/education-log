class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.integer :subject_id, null: false
      t.string :title, null: false
      t.string :name, null: false
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
      
    end
  end
end
