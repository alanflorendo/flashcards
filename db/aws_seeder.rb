require 'csv'

class AwsSeeder
  attr_reader :deck_collection

  DECK_COLLECTION_NAME = 'aws'
  DECK_NAMES = %w(guru_01
                  guru_02
  )

  def seed
  DECK_NAMES.each { |d| make_deck_and_cards(d) }
  end

  def initialize
    @deck_collection = DeckCollection.find_or_create_by(name: DECK_COLLECTION_NAME)
    puts "Created/Verified Deck Collection: #{@deck_collection.name}"
  end

  def make_deck_and_cards(filename)
    csv_text = File.read(Rails.root.join('db', 'cards', 'aws', "#{filename}.txt"))
    deck_name = filename.humanize.titleize
    deck = Deck.find_by(name: deck_name)
    if deck
      puts "#{filename} already exists"
    else
      deck = Deck.create(name: deck_name, deck_collection: @deck_collection)
      csv = CSV.parse(csv_text, headers: true)
      puts "Creating deck for #{deck_name}"
      make_cards(deck, csv)
    end
  end

  def make_cards(deck, csv)
    csv.each do |row|
      card = row.to_hash
      Card.create(front: card['Front'],
                  back: card['Back'], review: false,
                  deck_id: deck.id)
    end
    puts "Created #{csv.length} cards for #{deck.name}"
  end
end
