require 'date'
require 'yaml'

REGEX = /^([12])(\d{2})([01]\d)(\d{2})(\d{6})(\d{2})/

def valid_key?(ssn, key)
  ssn_without_key = ssn[0..-3]
  remainder = (97 - ssn_without_key.to_i) % 97
  remainder == key.to_i
end

def french_ssn_info(ssn)
  # 1. Validation
  # if ssn is not equal to pattern:
  #   return an error message.
  ssn = ssn.gsub(/\s/, '')
  match_data = ssn.match(REGEX)
  return 'The number is invalid' if match_data.nil?

  # 2. Extract data
  gender = match_data[1] == "1" ? 'male' : 'female'
  month = Date::MONTHNAMES[match_data[3].to_i]
  year = match_data[2]

  departments = YAML.load_file('data/french_departments.yml')
  department = departments[match_data[4]]

  key = match_data[6]
  return 'The number is invalid' unless valid_key?(ssn, key)

  "a #{gender}, born in #{month}, '#{year} in #{department}."
end
