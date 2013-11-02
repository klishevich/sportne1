class Video < ActiveRecord::Base
  attr_accessible :description, :name, :src, :rating
  belongs_to :user

  validates :rating, presence: true, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000}
  validates_uniqueness_of :src
  validates :name, presence: true
  validates :src, presence: true

  after_initialize :init

  def init
    self.rating  ||= 0           #will set the default value only if it's nil
  end
end
