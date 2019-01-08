class AddIconToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :icon, :string
  end
end
