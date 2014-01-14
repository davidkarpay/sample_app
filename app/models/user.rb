class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
# attr_accessible(:name, :email)

	before_save { |user| user.email = email.downcase }
# sets user's email to lowercase version of its value
	validates :name, presence: true, length: { maximum: 50 }
# validates(:name, {:presence => true}, {:length => {:maximum => 50}})
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
# validates(:email, {:presence => true}, {:f => {:w, V}}...)
	validates :password, presence: true, length: { minimum: 6 }
	#
	validates :password_confirmation, presence: true
	#
end
