class SwitchToDeterministicEncryption < ActiveRecord::Migration[7.0]
  class StochasticPerson < ActiveRecord::Base
    self.table_name = 'people'

    encrypts :first_name
    encrypts :last_name
  end

  class DeterministicPerson < ActiveRecord::Base
    self.table_name = 'people'

    encrypts :first_name, deterministic: true
    encrypts :last_name, deterministic: true
  end

  def up
    StochasticPerson.find_each do |s|
      d = DeterministicPerson.find(s.id)
      DeterministicPerson.encrypted_attributes.each do |attr|
        d.send "#{attr}=", s.send(attr)
      end

      d.save(validate: false, touch: false)
    end
  end

  def down
    DeterministicPerson.find_each do |d|
      s = StochasticPerson.find(d.id)
      StochasticPerson.encrypted_attributes.each do |attr|
        s.send "#{attr}=", d.send(attr)
      end

      s.save(validate: false, touch: false)
    end
  end
end
