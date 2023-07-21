class Person < ApplicationRecord
  encrypts :first_name, deterministic: true
  encrypts :last_name, deterministic: true
end
