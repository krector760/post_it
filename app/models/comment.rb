class Comment < ActiveRecord::Base
	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	belongs_to :post
	has_many :votes, as: :voteable

	validates :body, presence: true,
                    length: { minimum: 5 }

def total_votes
		self.up_votes - self.down_votes
	end

	def up_votes
	self.votes.where(votes: true).size
	end
	
	def down_votes
	self.votes.where(votes: false).size
	end

                    
end
