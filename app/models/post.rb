class Post < ApplicationRecord
	has_many :comments
	has_one :ditum
	validates :title, presence: true
end
