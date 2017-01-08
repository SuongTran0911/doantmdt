class Category < ApplicationRecord
	has_many :products

	validates :nameCategory,  presence: true
end
