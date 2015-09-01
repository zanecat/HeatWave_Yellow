class User < ActiveRecord::Base
	has_secure_password
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :username, presence: true, length: { maximum: 50 }
	validates :firstname, presence: true, length: { maximum: 50 }
	validates :lastname, presence: true, length: { maximum: 50 }
	validates :password, length: { minimum: 6 }
	VALID_PHONE_REGEX = /\d{10}/
	validates :phone_number, presence: true, format: {with: VALID_PHONE_REGEX}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false } 
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	private
	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end