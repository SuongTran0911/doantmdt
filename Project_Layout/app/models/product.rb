class Product < ApplicationRecord
	
  belongs_to :user
  belongs_to :category

  #validate
  validates :nameProduct, :price , :content, :address, :image_link, :category_id ,  presence: true
  
  acts_as_votable

  mount_uploader :image_link,  ImageProductUploader

end
