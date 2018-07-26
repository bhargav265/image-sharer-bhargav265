class AddBreedToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :breed, :string
  end
end
