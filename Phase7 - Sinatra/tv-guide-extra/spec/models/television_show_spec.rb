require "spec_helper"
#
# 1) TelevisionShow objects should be initialized with a title, network,
# starting year, genre, and synopsis. These attributes should have reader methods associated with them.
# 2) The TelevisionShow class should have a class method called all. This method
# should return an array of TelevisionShow objects whose attributes correspond to each data row in the csv file.
# 3) The TelevisionShow class should have an instance method called errors.
# On a newly initialized object, this method should return an empty array.
# 4) The TelevisionShow class should have an instance method called valid?.
# This method should return true if the two following validations are true:
# - None of the attritubes of the instance object are empty strings.
# - The title attribute of the instance object is not present in the csv file
# 5) The TelevisionShow class should have an instance method called save

describe TelevisionShow do
 # Add tests here
end
