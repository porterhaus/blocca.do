class ListPreviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :viewable, :open, :created_at, :updated_at, :user, :tasks

  has_many :tasks

  def user
    {:id => object.user.id, :name => object.user.name}
  end
end
