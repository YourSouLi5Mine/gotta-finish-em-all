class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  validate :content_or_image

  def content_or_image
    errors.add(:error, ': formulario vacío') unless self.content.present? || self.image.attached?
  end
end
