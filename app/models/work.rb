class Work < ActiveRecord::Base
  belongs_to :video
  belongs_to :user
  attr_accessible :description, :mark

  validates :mark, presence: true, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 10}
  validates :description, presence: true, length: {minimum: 5, maximum: 200}

end
