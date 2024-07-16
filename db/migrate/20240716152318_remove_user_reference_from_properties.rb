class RemoveUserReferenceFromProperties < ActiveRecord::Migration[7.1]
  def change
    remove_reference :properties, :user, foreign_key: true
  end
end
