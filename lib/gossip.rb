class Gossip 

attr_accessor :author, :content

    def initialize(input_author,input_content)

    @author =input_author
    @content = input_content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author,@content]
        end
    end

    def self.all

        all_gossips = []
        CSV.foreach("./db/gossip.csv", headers: true) do |row| 
            gossip = self.new(row[0],row[1])
            all_gossips << gossip
        end

        return all_gossips

    end

    def self.find(number_gossip)
        return self.all[number_gossip]
    end

    
    

end
