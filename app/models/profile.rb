class Profile < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true, length: {minimum: 3, maximum: 50}
    validates :bio, presence: true, length: {minimum: 3, maximum: 50}
    validates :specialization, presence: true, length: {minimum: 3, maximum: 50}
    validates :user_id, presence: true

end
