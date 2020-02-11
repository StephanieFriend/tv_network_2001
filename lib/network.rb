class Network


  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    all_main_characters = []
    @shows.each do |show|
      show.characters.each do |character|
        if character.salary > 500_000
          all_main_characters << character
        end
      end
    end
    all_main_characters
  end

  def actors_by_show
    show_actors = {}
    @shows.map do |show|
      show_actors[show] = show.characters.map do |character|
                          character.actor
                          end
    end
    show_actors
  end

  def shows_by_actor
    actors_shows = {}
    array = []
    @shows.map do |show|
      if actors_shows.include?(show.characters.map { |character| character.actor }.first)
        actors_shows[show.characters.map { |character| character.actor }.first] =  actors_shows[show.characters.map { |character| character.actor }.first] << show
      else
        actors_shows[show.characters.map { |character| character.actor }.first] = [show]
      end
    end
    actors_shows
  end
end
