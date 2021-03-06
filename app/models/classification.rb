class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all
  end

  def self.longest
    binding.pry
    #self.joins(:boats).group('classifications.id').order('boats.length desc')
    # Boat.all.order('length desc').first.classifications
    Boat.find_by(length: Boat.maximum('length')).classifications
  end

end
