class Pokemon
  
  attr_accessor :name, :type, :db 
  attr_reader :db
  
  def initialize(name, type, db, id=NIL)
    @name = name
    @type = type
    @db = db
    @id = id
  end 
  
  def self.save
     sql = <<-SQL
        INSERT INTO pokemon (name, type, db)
        VALUES (?, ?, ?)
        SQL
        DB[:conn].execute(sql, self.name, self.type, self.db)

        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    
  end 
  
  def self.find(id)
    sqp = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?
    LIMIT 1 
    SQL
    
    DB[:conn].execute(sql, id).map do |row|
      self.new_from_db(row)
    end.first
  end 
  
   def self.new_from_db(row)
    pokemon = self.new(row[1], row[2], row[0])
    pokemon
  end
  
end
