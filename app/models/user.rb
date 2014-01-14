class User < ActiveRecord::Base
	attr_accessible :name, :email
# attr_accessible(:name, :email)

	before_save { |user| user.email = email.downcase }
# sets user's email to lowercase version of its value
	validates :name, presence: true, length: { maximum: 50 }
# validates(:name, {:presence => true}, {:length => {:maximum => 50}})
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
# validates(:email, {:presence => true}, {:f => {:w, V}}...)

end
