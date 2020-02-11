
UserCampground.destroy_all
Campground.destroy_all
User.destroy_all

campgrounds = RestClient.get "https://developer.nps.gov/api/v1/campgrounds?stateCode=co&api_key=3h90U6sxs7uzFVrhFU5PBItP0XZKV2cJWikfOeE5"
parsed_json = JSON.parse(campgrounds)
parsed_campgrounds = parsed_json["data"].map do |campground|
    campground = Campground.create(
        name: campground["name"],
        description: campground["description"],
        park_code: campground["parkCode"],
        total_sites: campground["campsites"]["totalsites"],
        latlong: campground["latLong"]
    )
end

user1 = User.create(first_name: "Adam", last_name: "Shappy", current_state: "CO")
user2 = User.create(first_name: "Zach", last_name: "Mayle", current_state: "CO")
user3 = User.create(first_name: "Ahmed", last_name: "Gaber", current_state: "CO")
user4 = User.create(first_name: "Barack", last_name: "Obama", current_state: "DC")
user5 = User.create(first_name: "Tronald", last_name: "Dump", current_state: "DC")

# UserCampground.create(user: user1, campground_id: 62)


# binding.pry