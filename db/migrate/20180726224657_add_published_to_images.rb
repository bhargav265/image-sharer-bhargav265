class AddPublishedToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :published, :boolean
  end
end
