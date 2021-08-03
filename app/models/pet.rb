class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def as_json(options={})
  {
    :id => id,
    :name => name,
    :age => age,
    :status => status,
    :image_url => Rails.application.routes.url_helpers.rails_blob_path(
      image, 
      only_path: true
    )
  }
  end

end
