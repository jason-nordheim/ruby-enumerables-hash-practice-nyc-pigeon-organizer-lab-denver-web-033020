require "PrettyPrint"

def nyc_pigeon_organizer(data)
  # create an array of arrays containing the pigeons by color
  # [[:purple, ["Theo", "Peter Jr.", "Lucky"]],
  pigeons_by_color = data[:color].map { |x| x }
  # get all the pigeon names
  names = pigeons_by_color.flat_map {|x| x[1]}.uniq()
  # get the different genders
  pigeons_by_gender = data[:gender].map { | x | x }
  # get the different locations
  pigeons_by_location = data[:lives].map{ | x | x }

  # create the initial hash (with empty arrays)
  output = {}
  i = 0
  while i < names.count do
    output[names[i]] = {
      :color => [],
      :gender => [],
      :lives => []
    }
    i += 1
  end
  output = assign_attribute(output, pigeons_by_color, :color)
  output = assign_attribute(output, pigeons_by_gender, :gender)
  output = assign_attribute(output, pigeons_by_location, :lives)

  return output
end

# input:
# --> AoA w/ index 0 = color & index 1 = names of corresponding pigeons
# ouput:
# --> updated pigeon hash with color assigned
def assign_attribute(pigeon_list_hash, data, key)
  i =0
  while i < data.count do
    value = data[i][0]
    names_ary = data[i][1]
    j = 0
    while j < names_ary.count do
      name = names_ary[j]
      if name != nil
        pigeon_list_hash[name][key] << value
        end
      j += 1
    end
    i += 1
  end
  return pigeon_list_hash
end
