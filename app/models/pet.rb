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
    :found_name => found_name,
    :found_phone => found_phone,
    :image_url => get_image
  }
  end

  def get_image
    if self.image.attached?
      return Rails.application.routes.url_helpers
        .rails_representation_url(image.variant(
          :gravity=>"North", 
          resize: "200x200^",
          crop: '200x200+0+0'
        )
        .processed, only_path: true)
    end
    return "/pet.png"
  end  

end
