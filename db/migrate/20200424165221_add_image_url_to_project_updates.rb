class AddImageUrlToProjectUpdates < ActiveRecord::Migration[6.0]
  def change
    add_column :project_updates, :image_url, :string
  end
end
