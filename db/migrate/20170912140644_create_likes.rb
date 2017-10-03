class CreateLikes < ActiveRecord::Migration
	def change
		create_table :likes do |t|
		t.references(:status, :user, index: true)
		t.timestamps
		end
	end
end
