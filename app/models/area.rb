class Area < ApplicationRecord
    validates :nombreArea, uniqueness: true
    has_many :programas, dependent: :destroy
    mount_uploader :avatar, AvatarUploader
end
