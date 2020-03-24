class Post < ApplicationRecord
	validates :title, {presence: true, length: {maximum: 50}}
	validates :body, {length: {in: 10..1000}}

	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	attachment :image
end
