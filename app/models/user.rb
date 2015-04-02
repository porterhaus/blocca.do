class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, presence: true
  validates :auth_token, uniqueness: true

  before_create :generate_authentication_token
  before_create :set_user_role
  before_create do
    set_auth_token_flag(true)
  end

  has_many :lists, dependent: :destroy

  def generate_authentication_token
    self.auth_token = Devise.friendly_token
  end

  def regenerate_token
    generate_authentication_token
    save
  end

  def set_user_role
    self.role = 'member'
  end

  def set_auth_token_flag(flag)
    self.auth_token_flag = flag
  end

  def reactivate_flag
    self.set_auth_token_flag(true)
    save
  end

  def deactivate_flag
    self.set_auth_token_flag(false)
    save
  end

  def admin?
    role=='admin'
  end

  def member?
    role=='member'
  end

end
