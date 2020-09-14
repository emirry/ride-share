########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
#   driver_records = hash
#   drivers = array
#   date cost, riders, ratings = nested hash that have nested arrays
# Which layers are nested in each other?
#   arrays in each hash, that's nested in an array
#  drivers are nested in the whole hash structure, driver_records
#   hashes containing data: date/cost/rider/rating nested in the driver's array
#   collection of arrays nested in the data hash
# Which layers of data "have" within it a different layer?
#   depending on the date, the cost/rider/ratings may have a collection of array
# Which layers are "next" to each other?
#   hashes of the next date the driver drove
#   arrays of different drivers are next to each other (separated by hashes)
########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
#   Hash of an array of hashes that will have nested arrays...?
#   Some will have a collection of arrays inside a hash data structure

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

driver_records = {
    DR0001: [
        {
            date: "3rd Feb 2016",
            cost: 10,
            rider: "RD0003",
            rating: 3
        },
        {
            date: "3rd Feb 2016",
            cost: 30,
            rider: "RD0015",
            rating: 4
        },
        {
            date: "5th Feb 2016",
            cost: 45,
            rider: "RD0003",
            rating: 2
        }
    ],
    DR0002: [
        {
            date: "3rd Feb 2016",
            cost: 25,
            rider: "RD0073",
            rating: 5
        },
        {
            date: "4th Feb 2016",
            cost: 15,
            rider: "RD0013",
            rating: 1
        },
        {
            date: "5th Feb 2016",
            cost: 35,
            rider: "RD0066",
            rating: 3
        }
    ],
    DR0003: [
        {
            date: "4th Feb 2016",
            cost: 5,
            rider: "RD0066",
            rating: 5
        },
        {
            date: "5th Feb 2016",
            cost: 50,
            rider: "RD0003",
            rating: 2
        }
    ],
    DR0004: [
        {
            date: "3rd Feb 2016",
            cost: 5,
            rider: "RD0022",
            rating: 5
        },
        {
            date: "4th Feb 2016",
            cost: 10,
            rider: "RD0022",
            rating: 4
        },
        {
            date: "5th Feb 2016",
            cost: 20,
            rider: "RD0073",
            rating: 5
        }
    ]
}

# - the number of rides each driver has given
def sum_rides(rides_list)
  rides_list.each do |driver, trip|
    puts "#{driver} gave #{trip.length} rides"
  end
  return rides_list
end

# - the total amount of money each driver has made
def sum_money(total_cost)
  total_earned = 0

  total_cost.each do |driver, cost_value|
    cost_value.each do |earning|
      trip_cost = earning[:cost]
      total_earned += trip_cost
    end
    puts "#{driver} made $#{'%.2f' % total_earned}"
    total_earned = 0
  end
  return total_earned
end

# - the average rating for each driver
def find_average(driver_rating)
  rating_total = 0
  rating_average = 0

  driver_rating.each do |driver, rating|
    rating.each do |review|
      rider_review = review[:rating]
      rating_total += rider_review
      rating_average = rating_total / rating.length
    end
    puts "#{driver} average rating: #{rating_average}"
    rating_total = 0
  end
  return rating_average
end

# - Which driver made the most money?
# - Which driver has the highest average rating?

#### OUTPUTS ####
puts "Number of rides each driver has given:"
sum_rides(driver_records)

puts "\nTotal amount of money each driver has made:"
sum_money(driver_records)

puts "\nAverage rating for each driver:"
find_average(driver_records)
