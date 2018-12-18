class AddSuggestionsToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :suggestions, :string
  end
end
