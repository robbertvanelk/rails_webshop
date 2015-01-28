class Product < ActiveRecord::Base
	belongs_to :category
	has_many :orders
	has_many :users, through: :orders


	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	# before_validation { self.photo.clear if self.delete_photo == '1' }

end
