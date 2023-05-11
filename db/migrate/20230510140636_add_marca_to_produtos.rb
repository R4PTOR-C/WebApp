class AddMarcaToProdutos < ActiveRecord::Migration[7.0]
  def change
    add_column :produtos, :marca, :string
  end
end
