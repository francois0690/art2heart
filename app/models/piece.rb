class Piece < ApplicationRecord
  validates :name, presence: true
  has_many :transactions #, dependent: :destroy
  belongs_to :owner , class_name: "User", foreign_key: "user_id"
end
