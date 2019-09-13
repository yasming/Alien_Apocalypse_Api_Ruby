IS_ABDUCTED = 'ABDUCTED'
IS_NOT_ABDUCTED = 'NOT ABDUCTED'

class Survivor < ApplicationRecord
    
    validates :name, presence: true
    validates :age, presence: true
    validates :gender, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true

    def self.is_abducted flag
        flag.to_i >= 3        
    end

    def self.is_not_abducted flag
        flag.to_i < 3        
    end
    
    def self.statistics
        survivors = self.list_all
        abducteds = survivors.count { |survivor| self.is_abducted survivor.flag }
        not_abducteds = survivors.count { |survivor| self.is_not_abducted survivor.flag }
        
        {abducteds: (abducteds*100)/survivors.length, not_abducteds: (not_abducteds*100)/survivors.length }.as_json
    end    

    def self.list_all  
        self.select("name", "flag").group(:name, :flag, :id).order(:name)
    end

    def self.display_all
        survivors = self.list_all
        survivors.map { |survivor| [self.display_fliendly(survivor.name, survivor.flag)] }
    end

    def self.display_fliendly name, flag
        status = if self.is_abducted flag then IS_ABDUCTED else IS_NOT_ABDUCTED end
        {name: name,  status: status}.as_json
    end

    # def self.list_allWithTheirSituation
    #     Survivor.select("name, case when flag >= 3 then 'abducted' else 'non-abducted' end as situation").group(:name,:flag,:id).order(:name).as_json(:except => :id)
    # end

    # def self.listPercentageOfAbductedAndNonAbductedSurvivors
    #     Survivor.select('(count(*)-COUNT( case when flag >=3  then 1 else null end))*100/Count(*) AS "non-abducted", COUNT( case when flag >=3  then 1 else null end)*100/count(*) AS abducted').as_json(:except => :id)
    # end
end
