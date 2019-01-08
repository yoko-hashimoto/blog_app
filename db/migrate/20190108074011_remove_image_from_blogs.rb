class RemoveImageFromBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :image, :string
  end
end
