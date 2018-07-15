class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize (id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    attributes_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: attributes_array[0], name:attributes_array[1], type:attributes_array[2], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
    binding.pry 
  end

end
