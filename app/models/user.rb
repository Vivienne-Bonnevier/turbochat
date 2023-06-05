class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  # Stops showing own name on list of logged-in users
  scope :all_except, -> (user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  has_many :messages
  belongs_to :role

  # this should be whatever the role_id for admin would be (in this case, 2)
  # this saves on queries
  def admin?
    self.role_id == 2
  end

  def staff?
    self.role_id == 2 || self.role_id == 3
  end
end
