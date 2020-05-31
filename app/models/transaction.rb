class Transaction < ApplicationRecord
  validates :start, presence: true
  validates :end, presence: true
  validates :status, inclusion: { in: %w(demande acceptee annulee),
      :message => "%{value} n'est pas un status valide" }
  belongs_to :user
  belongs_to :piece
end

