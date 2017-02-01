ActiveAdmin.register Item do
  menu label: "Item Creation",priority: 3


  filter :item_code
  filter :item_name

  scope :all

 index do
   id_column
    column :item_code	
	column :item_name
    column :unit_price
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
