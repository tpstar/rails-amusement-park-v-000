class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !enough_tickets? && tall_enough?
       "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif tall_enough? && !enough_tickets
       "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
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
