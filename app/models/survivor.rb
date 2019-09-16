class Survivor < ApplicationRecord
    
    validates :name, presence: true
    validates :age, presence: true
    validates :gender,inclusion: { in: [ true, false ], message: "gender can't be blank"}
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
        {abducteds: (abducteds*100.0)/survivors.length, not_abducteds: ((survivors.length-abducteds)*100.0)/survivors.length }.as_json
    end    

    def self.list_all  
        self.select("name", "flag").group(:name, :flag, :id).order(:name)
    end

    def self.display_all
        survivors = self.list_all
        survivors.map { |survivor| [self.display_friendly(survivor.name, survivor.flag)] }
    end

    def self.display_friendly name, flag
        status = if self.is_abducted flag then IS_ABDUCTED else IS_NOT_ABDUCTED end
        {name: name,  status: status}.as_json
    end

    def self.flagged id
        survivor = self.find(id)
        survivor.flag = survivor.flag + 1
        survivor.save
        survivor
    end
    
    # def self.list_all_with_their_status
    #     Survivor.select("name, case when flag >= 3 then 'abducted' else 'non-abducted' end as status")
    #             .group(:name,:flag,:id)
    #             .order(:name)
    #             .as_json(:except => :id)
    # end

    # def self.list_percentage_of_abducted_and_non_abducted_survivors
    #     Survivor.select('(count(*)-COUNT( case when flag >=3  then 1 else null end))*100.0/Count(*) AS "non-abducted", COUNT( case when flag >=3  then 1 else null end)*100.0/count(*) AS abducted')
    #             .as_json(:except => :id)
    # end
end
