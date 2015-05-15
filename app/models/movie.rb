class Movie < ActiveRecord::Base
  def director
    Director.find(self.director_id)
  end

  def roles
    Role.where(:movie_id => self.id)
  end

  def actors
    actors = []
    self.roles.each do |role|
      actors << role.actor
    end
    return actors
  end

  def watches
    Watch_List.where(:movie_id => self.id)
  end
end
