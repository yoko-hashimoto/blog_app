class RemoveIconFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :icon, :string
  end
end
