USER_ATTRIBUTES = [
  { first_name: 'Eric', last_name: 'Kelly', email: 'ekelly@launchacademy.com' },
  { first_name: 'Adam', last_name: 'Sheehan', email: 'asheehan@launchacademy.com' },
  { first_name: 'Dan', last_name: 'Pickett', email: 'dpickett@launchacademy.com' },
  { first_name: 'Evan', last_name: 'Charles', email: 'echarles@launchacademy.com' },
  { first_name: 'Faizaan', last_name: 'Shamsi', email: 'fshamsi@launchacademy.com' },
  { first_name: 'Helen', last_name: 'Hood', email: 'hhood@launchacademy.com' },
  { first_name: 'Corinne', last_name: 'Babel', email: 'cbabel@launchacademy.com' }
]
User.destroy_all
Project.destroy_all
USER_ATTRIBUTES.each do |attributes|
  new_user = User.create!(attributes)
  new_project = Project.create!(name: 'My to-do list', description: 'A brief to-do list.')
  Join.create!(user_id: new_user.id, project_id: new_project.id)
end
