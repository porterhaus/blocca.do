class List < ActiveRecord::Base
  validates :title, :user_id, presence: true
  belongs_to :user

  def viewable?
    self.viewable == true
  end

  def open?
    self.open == true
  end
end
