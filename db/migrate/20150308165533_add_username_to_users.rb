class AddUsernameToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.string :username, null: false, default: ""
    end

    add_index :users, :username, unique: true
  end
end
