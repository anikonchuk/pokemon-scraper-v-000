class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    attributes_array = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    Pokemon.new(id: attributes_array[0], name:attributes_array[1], type:attributes_array[2], db: db)
  end

  def alter_hp(hp, db)
    
  end

end
