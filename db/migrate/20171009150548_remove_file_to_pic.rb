class RemoveFileToPic < ActiveRecord::Migration
  def change
    remove_column :pics, :file, :binary
  end
end
