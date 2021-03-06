class Post < ActiveRecord::Base
	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories
	has_many :votes, as: :voteable


	validates :title, presence: true, length: { minimum: 1 }
	validates :description, presence: true
	validates :url, presence: true, length: { minimum: 2 }

	before_save :generate_slug

	def total_votes
		self.up_votes - self.down_votes
	end

	def up_votes
	self.votes.where(votes: true).size
	end
	
	def down_votes
	self.votes.where(votes: false).size
	end

	def to_param
		self.slug
	end

	def generate_slug
		self.slug = self.title.gsub(" ", "-").downcase
	end


end