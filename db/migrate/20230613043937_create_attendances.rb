class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.string :name
      t.string :status
      t.text :reason
      t.datetime :start_time
      t.references :user, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.timestamps
    end
  end
end
