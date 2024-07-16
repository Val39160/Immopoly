class AddUserReferenceToProjects < ActiveRecord::Migration[7.1]
  def change
    add_reference :projects, :user, foreign_key: true, null: false
  end
end
