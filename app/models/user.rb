class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_and_belongs_to_many :friends,
							class_name: "User", 
							join_table:  :friends, 
							foreign_key: :user_id, 
							association_foreign_key: :friend_user_id

	validates :name, presence: true
	validates :email, presence: true,
					  uniqueness: true
	has_secure_password
	validates :password, presence: true, length: {within: 6..20}
	validates :password_confirmation, presence: true
	validates_format_of :email, {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}


    def is_friend?(user)
    	return self.friends.include?(user)
    end
end