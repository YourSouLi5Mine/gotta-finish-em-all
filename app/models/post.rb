class Post < ApplicationRecord
  has_one_attached :image

  has_many :post_users
  has_many :users, through: :post_users

  validate :content_or_image

  def content_or_image
    errors.add(:error, ': formulario vacío') unless self.content.present? || self.image.attached?
  end

  def content_creator_id
    self.users.where(role_id: 2).first&.id
  end

  def designer_id
    self.users.where(role_id: 3).first&.id
  end
end
