task add_random_data: :environment do
  Member.transaction do
    acc = []

    ["bob", "alice", "cindy", "john", "dude"].shuffle.each do |first_name|
      last_names = ["hansen", "larsen", "pedersen"]
      last_names.shuffle.each do |middle_name|
        last_names.shuffle.each do |last_name|
          [6, 10, 15, 15, 20, 25, 27, 31, 56].shuffle.each do |number_of_years|
            date_of_birth = number_of_years.years.ago
            Member.membership_types.keys.shuffle.each do |type|
              acc << Member.new(
                first_name: first_name,
                middle_name: middle_name,
                last_name: last_name,
                date_of_birth: date_of_birth,
                membership_type: type,
              )
            end
          end
        end
      end
    end

    acc.shuffle.each(&:save!)
  end
end
