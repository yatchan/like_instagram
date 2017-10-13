class AddFileToPic < ActiveRecord::Migration
  def change
    add_column :pics, :file, :binary
  end
end
