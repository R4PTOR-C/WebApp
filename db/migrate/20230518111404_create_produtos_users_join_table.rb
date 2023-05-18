class CreateProdutosUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos_users, id: false do |t|
      t.belongs_to :produto
      t.belongs_to :user
    end

    add_index :produtos_users, [:produto_id, :user_id], unique: true
    add_index :produtos_users, [:user_id, :produto_id], unique: true
  end
end
