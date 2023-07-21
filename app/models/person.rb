class Person < ApplicationRecord
  encrypts :first_name
  encrypts :last_name
end
