class OrganizationDefaultGroups
  def after_create(organization)
    organization.groups.create name: 'Member'
    organization.groups.create name: 'Administrator'
    organization.groups.create name: 'ExOfficio'
    organization.groups.create name: 'Jail'
  end
  def before_destroy(organization)
    organization.groups.destroy organization.groups.where(name: 'Member')
    organization.groups.destroy organization.groups.where(name: 'Administrator')
    organization.groups.destroy organization.groups.where(name: 'ExOfficio')
    organization.groups.destroy organization.groups.where(name: 'Jail')
  end
end