class CreateLikes < ActiveRecord::Migration
	def change
		create_table :likes do |t|
		t.boolean :liked, default: false
		t.references(:status, :user, index: true)
		t.timestamps
		end
	end
end
