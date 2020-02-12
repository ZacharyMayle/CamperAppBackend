
UserCampground.destroy_all
Campground.destroy_all
Park.destroy_all
User.destroy_all

json_parks = RestClient.get "https://developer.nps.gov/api/v1/parks?stateCode=CO&api_key=3h90U6sxs7uzFVrhFU5PBItP0XZKV2cJWikfOeE5"
parsed_parks = JSON.parse(json_parks)
parsed_parks["data"].map do |park|
    Park.create(
        name: park["name"],
        designation: park["designation"],
        description: park["description"],
        url: park["url"],
        park_code: park["parkCode"]
    )
end

Park.all.map do |park|
    json_parks_campgrounds = RestClient.get "https://developer.nps.gov/api/v1/campgrounds?parkCode=#{park.park_code}&stateCode=co&api_key=3h90U6sxs7uzFVrhFU5PBItP0XZKV2cJWikfOeE5"
    parsed_campgounds = JSON.parse(json_parks_campgrounds)
    if parsed_campgounds["data"] == []
        print "hit"
    else 
        parsed_campgounds["data"].map do |campground|
            print "bitch"
            Campground.create(
                name: campground["name"],
                description: campground["description"],
                park_code: campground["parkCode"],
                total_sites: campground["campsites"]["totalsites"],
                latlong: campground["latLong"],
                park_id: park.id
            )
        end
    end
end


user1 = User.create(first_name: "Adam", last_name: "Shappy", current_state: "CO")
user2 = User.create(first_name: "Zach", last_name: "Mayle", current_state: "CO")
user3 = User.create(first_name: "Ahmed", last_name: "Gaber", current_state: "CO")
user4 = User.create(first_name: "Barack", last_name: "Obama", current_state: "DC")
user5 = User.create(first_name: "Tronald", last_name: "Dump", current_state: "DC")

UserCampground.create(user: user1, campground_id: 1, camping_duration: 4)
