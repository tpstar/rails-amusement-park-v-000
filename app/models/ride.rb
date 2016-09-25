class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if (not enough_tickets?) && tall_enough?
       "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif (not tall_enough?) && enough_tickets?
       "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif (not enough_tickets?) && (not tall_enough?)
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
    end
  end

  private
  def enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end

end
