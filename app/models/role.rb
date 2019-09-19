class Role < ApplicationRecord
  has_many :users

  def self.

  private

  def self.titleized_names
    Role.all.pluck(:name).map(&:titleize)
  end
end
