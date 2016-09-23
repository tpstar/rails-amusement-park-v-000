class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, :through => :rides

  validates :name, presence: true, uniqueness: true
  has_secure_password

  def mood
    if self.nausea < self.happiness
      "happy"
    else
      "sad"
    end
  end

end
