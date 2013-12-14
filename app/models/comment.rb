class Comment < ActiveRecord::Base
	belongs_to :commenter, foreign_key: 'username', class_name: 'User'
	belongs_to :post
	validates :body, presence: true,
                    length: { minimum: 5 }
end
