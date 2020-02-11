class Show


  attr_reader :name, :characters, :creator

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    @characters.sum { |characters| characters.salary }
  end

  def highest_paid_actor
    @characters.max_by do |character|
      character.salary
      return character.actor
    end
  end

  def actors
    all_actors = []
    @characters.each do |character|
      all_actors << character.actor
    end
    all_actors
  end
end