class Activity < ApplicationRecord
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
