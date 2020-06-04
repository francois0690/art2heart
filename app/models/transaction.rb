class Transaction < ApplicationRecord
  validates :date_start, presence: true, availability: true
  validates :date_end, presence: true, availability: true
  validates :status, inclusion: { in: %w(demande acceptee annulee),
      :message => "%{value} n'est pas un status valide" }
  validate :end_date_after_start_date
  belongs_to :user
  belongs_to :piece


  private

  def end_date_after_start_date
    return if date_end.blank? || date_start.blank?
    
    if date_end < date_start
      errors.add(date_end, "doit être après la date de début")
    end
 end
end


