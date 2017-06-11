require 'csv'

csv_text = File.read(Rails.root.join('db', 'cards', 'country_capitals.txt'))
csv = CSV.parse(csv_text, headers: true)

csv.each do |row|
  card = row.to_hash
  c = Card.create(front: card['Front'], back: card['Back'], review: false)
end
