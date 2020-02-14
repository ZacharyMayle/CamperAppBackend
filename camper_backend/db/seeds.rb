
UserCampground.destroy_all
Campground.destroy_all
Park.destroy_all
User.destroy_all

json_parks = RestClient.get "https://developer.nps.gov/api/v1/parks?stateCode=CO&api_key=3h90U6sxs7uzFVrhFU5PBItP0XZKV2cJWikfOeE5"
parsed_parks = JSON.parse(json_parks)
parsed_parks["data"].map do |park|
    Park.create(
        name: park["name"],
        latlong: park["latLong"],
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
                weather: campground["weatheroverview"],
                wheel_chair: campground["accessibility"]["wheelchairaccess"],
                cell_phone: campground["accessibility"]["cellphoneinfo"],
                fire_stove: campground["accessibility"]["firestovepolicy"],
                toilets: campground["amenities"]["toilets"][0],
                showers: campground["amenities"]["showers"][0],
                laundry: campground["amenities"]["laundry"][0],
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

# UserCampground.create(user_id: user1, campground_id: 1, camping_duration: 4)
# UserCampground.create(user_id: user2, campground_id: 2, camping_duration: 4)


# seed California Historic Trail with LatLong
Park.find(3).update(latlong: "lat:37.65518, long:-103.92598") 

# seed Old Spanish National Historic Trail with LatLong
Park.find(11).update(latlong: "lat:38.32189, long:-106.85933") 

# seed Pony Express National Historic Trail with LatLong
Park.find(12).update(latlong: "lat:40.93466, long:-102.32971") 

# seed Santa Fe Trail with LatLong
Park.find(15).update(latlong: "lat:37.65518, long:-103.92598") 

# random big foot generator
def big_foot_sightings_randomizer
    [true, false].sample
end

# update each Campground with big foot sighting randomizer
Campground.all.map do |campground| 
    campground.update(
        big_foot_sightings: big_foot_sightings_randomizer
    )
end