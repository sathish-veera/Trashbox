ActiveAdmin.register User do
  actions :all, except: [:edit, :destroy]
  menu label: "Users Login Report",priority: 2
  
  filter :email
  filter :is_admin
  filter :created_at

  scope :all, default: true
  scope("Today signup list") { |scope| scope.where(created_at: (Date.today.beginning_of_day..Date.today.end_of_day)) }


 index do
   id_column
    column :email
	column :created_at
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
