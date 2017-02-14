users = Organization.find_or_create_by name: 'Users'
officers = Organization.find_or_create_by name: 'Officers', parent: users
Organization.find_or_create_by name: 'Board', parent: officers
Organization.find_or_create_by name: 'Decon Ministry', parent: users
Organization.find_or_create_by name: 'Deconess Ministry', parent: users
Organization.find_or_create_by name: 'AYS Ministry', parent: users
Organization.find_or_create_by name: 'Pathfinder Ministry', parent: users
Organization.find_or_create_by name: 'Technology Ministry', parent: users