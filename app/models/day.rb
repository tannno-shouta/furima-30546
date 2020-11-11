class Day < ActiveHash::Base
  self.data =[
    { id: 1, day: '--' },
    { id: 2, day: '1〜2で日発送' },
    { id: 3, day: '2〜4で日発送' },
    { id: 4, day: '4〜７日で発送' }
]

include ActiveHash::Associations
  has_many :item
end
