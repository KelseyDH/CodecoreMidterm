class Idea < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  after_initialize :set_defaults

  before_save :capitalize_title

  belongs_to :user


  has_many :comments, dependent: :destroy


  private

  def capitalize_title
    self.title.capitalize!
  end

  def set_defaults
  end

end
