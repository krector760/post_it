class Comment < ActiveRecord::Base
	belongs_to :commenter, foreign_key: 'username', class_name: 'User'
	belongs_to :post
end
