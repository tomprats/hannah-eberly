User.create(
  admin: true,
  email: "tprats108@gmail.com",
  first_name: "Tom",
  last_name: "Prats",
  password: "password"
)

User.create(
  admin: true,
  email: "HEKEberly@gmail.com",
  first_name: "Hannah",
  last_name: "Eberly",
  password: "password"
)

group = Group.create(
  name: "Work"
)
Page.create(
  group_id: group.id,
  active: true,
  rank: 10,
  path: "work",
  name: "Work"
)

group = Group.create(
  name: "Commissioned Work"
)
Page.create(
  group_id: group.id,
  active: true,
  rank: 20,
  path: "commissioned-work",
  name: "Commissioned Work"
)

group = Group.create(
  name: "Exhibits"
)
Page.create(
  group_id: group.id,
  active: true,
  rank: 30,
  path: "exhibits",
  name: "Exhibits"
)

Page.create(
  active: true,
  rank: 40,
  path: "bio",
  name: "Bio"
)

Page.create(
  active: true,
  rank: 50,
  path: "contact",
  name: "Contact"
)
