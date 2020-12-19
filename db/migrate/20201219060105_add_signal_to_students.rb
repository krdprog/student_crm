class AddSignalToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :signal, :string
    add_index :students, :signal, unique: true
  end
end
