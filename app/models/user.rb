class User < ApplicationRecord
  belongs_to :role, optional: true
  belongs_to :resource, polymorphic: true, dependent: :destroy, autosave: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :mobile, presence: true, format: { with: /\d{10}/, message: "Not a valid mobile no" }
  validates :name, presence: true
  validates :mobile, uniqueness: true, numericality: true
  validates :username, uniqueness: true, allow_nil: true
end
