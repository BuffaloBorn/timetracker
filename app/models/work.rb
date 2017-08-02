class Work < ApplicationRecord
    belongs_to :project
    belongs_to :user

    scope :fullday, -> { where("hours >= 8")}
    scope :recent, -> { where("datetimeperformed > '#(Time.no -7.days)'")}
end
