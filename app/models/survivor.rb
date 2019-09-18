class Survivor < ApplicationRecord
    
    validates :name, presence: true
    validates :age, presence: true
    validates :gender,inclusion: { in: [ true, false ], message: "can't be blank"}
    validates :latitude, presence: true
    validates :longitude, presence: true

    def self.is_abducted flag
        flag.to_i >= 3        
    end

    def self.is_not_abducted flag
        flag.to_i < 3        
    end
    
    def self.statistics
        survivors = self.get_all
        abducteds = survivors.count { |survivor| self.is_abducted survivor.flag }
        not_abducteds = survivors.count { |survivor| self.is_not_abducted survivor.flag }
        {total_of_survivors:survivors.length, percentage_of_abducteds: (abducteds*100.0)/survivors.length, percentage_of_not_abducteds: ((survivors.length-abducteds)*100.0)/survivors.length }.as_json
    end    

    def self.get_all  
        self.select("name", "flag").group(:name, :flag, :id).order(:name)
    end

    def self.show_all
        survivors = self.get_all
        survivors.map { |survivor| [self.put_status_and_name_in_json_response(survivor.name, survivor.flag)] }
    end

    def self.put_status_and_name_in_json_response name, flag
        status = if self.is_abducted flag then IS_ABDUCTED else IS_NOT_ABDUCTED end
        {name: name,  status: status}.as_json
    end

    def self.flagged id
        survivor = self.find(id)
        survivor.flag = survivor.flag + 1
        survivor.save
        survivor
    end
end
