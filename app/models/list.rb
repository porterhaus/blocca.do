class List < ActiveRecord::Base
  validates :title, :user_id, presence: true
  has_many :tasks, dependent: :destroy
  belongs_to :user
end
