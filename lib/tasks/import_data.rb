class ImportData
  def self.get_csv(file_name, object)
    data = "lib/data/#{file_name}.csv"
    CSV.foreach(data, headers: true) do |row|
      hashed_row = row.to_hash
      if hashed_row['unit_price']
        hashed_row['unit_price'] = hashed_row['unit_price'].to_f/100
      end
      object.create!(hashed_row)
    end
  end
end