class Permission < ActiveRecord::Base
  belongs_to :role
  belongs_to :section
  belongs_to :client

  def self.check_permissions(page)
    section = Section.find_by_name(page)
    permission = all.find_by_section_id(section.id)
    return permission.is_create? || permission.is_update? || permission.is_destroy?
  end
end