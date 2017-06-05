list = List.create(name: 'Today')
Item.create(list: list, name: 'Email the landlord', done: true)
Item.create(list: list, name: 'Pickup the car', done: false)

list = List.create(name: 'Groceries')
Item.create(list: list, name: 'Buy sugar', done: false)
Item.create(list: list, name: 'Buy spice', done: false)
Item.create(list: list, name: 'Buy everything nice', done: true)
