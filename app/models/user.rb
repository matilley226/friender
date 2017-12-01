class User < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             :foreign_key => "member_id",
             :dependent => :destroy

  has_many   :groups,
             :foreign_key => "creator_id",
             :dependent => :destroy

  has_many   :invites,
             :foreign_key => "invitee_id",
             :dependent => :destroy

  has_many   :activities,
             :foreign_key => "proposer_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :group_memberships,
             :through => :memberships,
             :source => :group

  has_many   :activity_invites,
             :through => :invites,
             :source => :activity

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
