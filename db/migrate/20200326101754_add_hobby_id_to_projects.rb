class AddHobbyIdToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :hobby_id, :integer
  end
end
