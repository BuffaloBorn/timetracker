class Company < ApplicationRecord
    has_many :users
    has_many :projects

    validates :name, length: { minimum: 5 }
end
