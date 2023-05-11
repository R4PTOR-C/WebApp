class AddImageToProdutos < ActiveRecord::Migration[7.0]
  def change
    add_column :produtos, :image, :string
  end
end
