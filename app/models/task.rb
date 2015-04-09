class Task < ActiveRecord::Base 
  validates :description, presence: true
  belongs_to :list

  def get_list
    @list = List.find(self.list_id)
  end

  def open?
    get_list
    if @list.open
      true
    else
      false
    end
  end

  def viewable?
    get_list
    if @list.viewable
      true
    else
      false
    end
  end
        
end
