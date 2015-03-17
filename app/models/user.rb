class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, presence: true
  validates :auth_token, uniqueness: true

  before_create :generate_authentication_token!
  before_create :set_user_role!

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def set_user_role!
    self.role = 'member'
  end

  def admin?
    role=='admin'
  end

  def member?
    role=='member'
  end

end
