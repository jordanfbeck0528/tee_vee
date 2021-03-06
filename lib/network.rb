class Network
  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows.push(show)
  end

  def main_characters
    @shows.flat_map do |show|
      show.characters.select do |character|
        character if character.name == character.name.upcase && character.salary > 500000
      end
    end
  end

  def actors_by_show
    show_stuff = Hash.new { |hash, key| hash[key] = []}
    @shows.each do |show|
      show_stuff[show] = show.actors
    end
    show_stuff
  end

  def shows_by_actor
    actor_shows =  Hash.new { |hash, key| hash[key] = [] }
    @shows.select do |show|
      show.characters.each do |character|
        actor_shows[character.actor] += [show]
      end
    end
    actor_shows
  end

  def prolific_actors
    prolific = []
    most_shows = shows_by_actor.max_by do |show|
      show.count
    end
    prolific << most_shows.first
  end
end

# def actors_by_show
# show_stuff = Hash.new { |hash, key| hash[key] = []}
# @shows.each do |show|
#     show.characters.each do |show_data|
#       if show_stuff[show] == {}
#         show_stuff[show] = [show_data.actor]
#       else
#         show_stuff[show] << [show_data.actor]
#       end
#       show_stuff[show].flatten!
#     end
#   end
#   show_stuff
# end

# def main_characters
#   main_character = []
#   @shows.each do |show|
#     show.characters.each do |character|
#       main_character << character if character.name == character.name.upcase && character.salary > 500000
#     end
#   end
#   main_character
# end

#below method not finished in time
# def actors_by_show
# show_stuff = Hash.new { |hash, key| hash[key] = []}
# @shows.each do |show|
#   require "pry"; binding.pry
#   end
#   show_stuff
# end
#
