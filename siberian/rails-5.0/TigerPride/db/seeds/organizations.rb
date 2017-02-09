users = Organization.create name: 'Users'
officers = Organization.create name: 'Officers', parent: users
Organization.create name: 'Board', parent: officers
Organization.create name: 'Decon Ministry', parent: users
Organization.create name: 'Deconess Ministry', parent: users
Organization.create name: 'AYS Ministry', parent: users
Organization.create name: 'Pathfinder Ministry', parent: users
Organization.create name: 'Technology Ministry', parent: users