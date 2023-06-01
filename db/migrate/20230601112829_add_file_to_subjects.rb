class AddFileToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :file, :string
  end
end
