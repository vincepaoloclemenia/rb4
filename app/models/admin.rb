class Admin < ActiveRecord::Base
  validates_uniqueness_of :email, :username

  before_save :send_mail_and_generate_password, if: :valid?
 
  def send_mail_and_generate_password
    UserMailer.send_user_mail(email, password_hash).deliver
    self.salt = SecureRandom.hex
    self.password_hash = generate_password
  end

  def verify_password(password)
    password_hash == encrypt(password)
  end

  def generate_password
    digest = OpenSSL::Digest::SHA256.new
    digest.update(self.password_hash)
    digest.update(self.salt)
    digest.to_s
  end

  def encrypt password
    digest = OpenSSL::Digest::SHA256.new
    digest.update(password)
    digest.update(self.salt)
    digest.to_s
  end
  
end
