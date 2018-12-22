require 'csv'

class Order < ApplicationRecord
	belongs_to :store


	def self.to_csv
    attributes = %w{id store total_amt delivery_date }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |order|
        csv << attributes.map{ |attr| order.send(attr) }
      end
    end
  end
end
