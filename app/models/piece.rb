class Piece < ApplicationRecord
  validates :name, :photos, presence: true
  has_many :transactions #, dependent: :destroy
  belongs_to :owner , class_name: "User", foreign_key: "user_id"
  has_many_attached :photos
  validates :category, inclusion: { in: %w(peinture sculpture photo autres),
      :message => "%{value} n'est pas une cathégorie valide" }
end
