class Movie < ActiveRecord::Base
  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  #we have to go *pause* BACK TO THE FUTURE
  #dooooo doooo doooo, back to the future theme
  validate :release_date_is_in_the_past

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should probably be in the past") if release_date > Date.today
    end
  end

end
