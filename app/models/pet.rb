class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :age, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def as_json(options={})
  {
    :id => id,
    :name => name,
    :age => age,
    :status => status,
    :city => city,
    :state => state,
    :information => information,
    :image_url => get_image
  }
  end

  def get_image
    if self.image.attached?
      return Rails.application.routes.url_helpers.rails_blob_path(
        image, 
        only_path: true
      )
    end
    return "/pet.png"
  end

end
