class Task < ActiveRecord::Base 
  validates :description, presence: true
  belongs_to :list

  def open?
    !!list.open
  end

  def viewable?
    !!list.viewable
  end

  def user
    list.user
  end
        
end
