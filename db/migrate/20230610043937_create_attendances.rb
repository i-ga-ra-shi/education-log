class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.string :name
      t.string :status
      t.text :reason
      t.datetime :start_time
      t.timestamps
    end
  end
end
