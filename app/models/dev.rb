class Dev < ActiveRecord::Base

    has_many :freebies
    has_many :companies, through: :freebies

    def received_one? (item_name)
        self.freebies.any? {|f|
            f.item_name == item_name
        }
    end

    def give_away (dev, freebie)
        gift = self.freebies.find_by(id: freebie.id)
        gift.update(dev: dev) if gift
    end
    
end
