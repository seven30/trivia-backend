class AddJtiMatcherToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :jti, :string
    add_index :users, :jti, unique: true
  end
end
