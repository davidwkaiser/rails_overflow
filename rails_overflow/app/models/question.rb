class Question < ActiveRecord::Base
  validates :title, presence: true
  has_many :answers, dependent: :destroy
  attr_accessor :text

  def tags
    text
  end

  def tags=(input)
    self.text = input
  end


end
