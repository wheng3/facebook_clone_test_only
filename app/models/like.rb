class Like < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :status
	validates :user_id, presence: true
	validates :status_id, presence: true
end
