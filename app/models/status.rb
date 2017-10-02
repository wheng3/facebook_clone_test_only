class Status < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	has_many :likes, dependent: :destroy
	validates :title, presence: true, length: { minimum: 8, message: "title is too short" }
	validates :content, presence: true, length: { minimum: 10, message: "content is too short" }
	default_scope { order(created_at: :desc) }
end
