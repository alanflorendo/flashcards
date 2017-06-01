game = Game.new(name: 'First Game')
board = Board.new(name: 'First Board',
                  game_id: game.id)
cat_names = %w(Presidents Lakes Cheese Books Composers Holidays)
cats = cat_names.map { |name| Category.create(board: board, name: name) }
vals = [200, 400, 600, 800, 1000]

def create_fake_question(cat, val)
  Question.create(category: cat,
                  front:
end

cats.each do |cat|
  vals.each do |val|
    create_fake_question(cat, val)
  end
end
