class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
      mood > 0 ? "happy" : "sad"
    end
  end

  def not_enough_tickets(attraction)
    self.tickets < attraction.tickets
  end

  def not_min_height(attraction)
    self.height < attraction.min_height
  end

  def not_enough_tickets_and_not_min_height(attraction)
    not_enough_tickets(attraction) && not_min_height(attraction)
  end

  def update_details(attraction)
    self.tickets -= attraction.tickets
    self.nausea += attraction.nausea_rating
    self.happiness += attraction.happiness_rating
    self.save
  end
end