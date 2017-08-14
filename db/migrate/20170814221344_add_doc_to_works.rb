class AddDocToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :doc, :string
  end
end
