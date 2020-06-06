class Piece < ApplicationRecord
  validates :name, presence: true
  has_many :transactions #, dependent: :destroy
  belongs_to :owner , class_name: "User", foreign_key: "user_id"
  has_many_attached :photos
  validates :category, inclusion: { in: %w(peinture sculpture photo autres),
      :message => "%{value} n'est pas une catégorie valide" }

  def unavailable_dates
    transactions.pluck(:date_start, :date_end).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
