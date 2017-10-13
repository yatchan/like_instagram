class RemoveFilenameToPic < ActiveRecord::Migration
  def change
    remove_column :pics, :filename, :string
  end
end
