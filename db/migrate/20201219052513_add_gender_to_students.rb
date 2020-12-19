class AddGenderToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :gender, :integer
  end
end
