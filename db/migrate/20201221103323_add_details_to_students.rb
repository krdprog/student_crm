class AddDetailsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_index :students, :last_name
  end
end
