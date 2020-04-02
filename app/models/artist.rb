class Artist < ApplicationRecord
    belongs_to :user
    
    validates :name, presence: true
    validates :hometown, presence: true
    validates :img, presence: true
    validates :albums, presence: true
    has_many :songs, dependent: :destroy
end
