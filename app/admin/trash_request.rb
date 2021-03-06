ActiveAdmin.register TrashRequest do
	menu label: "Trash Requests List",priority: 1

  actions :all, except: [:new,:destroy]

  filter :tr_serial_no
  filter :request_status
  filter :trash_request_date

  scope :all, default: true
  scope("Today Trash Request list") { |scope| scope.where(trash_request_date: (Date.today.beginning_of_day..Date.today.end_of_day)) }


 index do
   id_column
    column :tr_serial_no
	column :request_status
    column :trash_request_date
	column :total_amount
    actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
