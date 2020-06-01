class Transaction < ApplicationRecord
  validates :start, presence: true, availability: true
  validates :end, presence: true, availability: true
  validates :status, inclusion: { in: %w(demande acceptee annulee),
      :message => "%{value} n'est pas un status valide" }
  validate :end_date_after_start_date
  belongs_to :user
  belongs_to :piece


  private

  def end_date_after_start_date
    return if :end.blank? || :start.blank?
    
    if :end > :start
      errors.add(:end, "doit être après la date de début")
    end
 end
end

