class PostComment < ApplicationRecord
	validates :comment, {length: {in: 2..300}}
	belongs_to :user
	belongs_to :post
end
