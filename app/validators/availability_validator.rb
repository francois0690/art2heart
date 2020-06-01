class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    transactions = Tansaction.where(["piece =?", piece])
    date_ranges = transactions.map { |b| b.start..b.end }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end