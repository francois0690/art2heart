class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    transactions = Transaction.where(["piece_id =?", record.piece_id])
    date_ranges = transactions.map { |b| b.date_start..b.date_end }
    
    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
        break
      end
    end
  end
end