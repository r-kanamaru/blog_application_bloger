class RemoveNameFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :name, :string
  end
end
