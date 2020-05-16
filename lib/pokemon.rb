class Pokemon
  
  attr_accessor :name, :type, :db 
  attr_reader :db
  
  def self.initialize(name, type, db, id=NIL)
    @name = name
    @type = type
    @db = db
    @id = id
  end 
  
  def self.save
  end 
  
  def self.find
  end 
  
end
