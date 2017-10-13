class AddFilenameToPic < ActiveRecord::Migration
  def change
    add_column :pics, :filename, :string
  end
end
