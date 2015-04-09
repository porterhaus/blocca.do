class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :viewable, :open, :created_at, :updated_at, :user

  def user
    {:id => object.user.id, :name => object.user.name}
  end
end
