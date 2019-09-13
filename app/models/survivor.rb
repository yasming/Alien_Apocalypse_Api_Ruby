class Survivor < ApplicationRecord
    
    validates :name, presence: true
    validates :age, presence: true
    validates :gender, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true

    def self.listAllSurvivorsWithTheirSituation
        survivors = Survivor.select("name, case when flag >= 3 then 'abducted' else 'non-abducted' end as situation").group(:name,:flag,:id).order(:name).as_json(:except => :id)
        return survivors
    end
end
