require 'open-uri'
class Activity < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :visual, VisualUploader

  # Direct associations

  belongs_to :proposer,
             :class_name => "User"

  belongs_to :category

  has_many   :invites,
             :dependent => :destroy

  # Indirect associations

  has_many   :invitees,
             :through => :invites,
             :source => :invitee

  # Validations

end
