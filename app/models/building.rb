class Building < ApplicationRecord
    has_many :offices
    has_many :companies, through: :offices

    def get_all_floors
        return (0..self.number_of_floors).to_a
    end


    def total_rent
        self.companies.count * self.rent_per_floor
    end

    def get_floors(company)
        self.offices.select do |office|
            if office.company_id == company.id
                office.floor
            end
        end
    end

    def get_available_offices
        all_taken_floors = self.offices.pluck(:floor)
        available_floors = get_all_floors.select {|floor| !all_taken_floors.include?(floor) }
        available_floors.map {|af| Office.new(floor:af)}
    end
end
