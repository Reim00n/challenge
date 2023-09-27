ActiveAdmin.register Cliente do
  menu priority: 2
  permit_params :nombre, 
                :email,
                :preferencias,preferencia_ids:[]
                
  
  show do
    panel 'Ciente' do
      attributes_table_for cliente do
        row :nombre
        row :email
        row :preferencias
      end
    end
    panel "Preferencias" do
      table_for cliente.preferencias do
          column :id
          column :texto
          column :created_at
      end
    end
  end
  form do |f|
    f.inputs do
      f.input :nombre
      f.input :email
      f.input :preferencias, as: :select, collection: Preferencia.all.collect { |preferencia| [preferencia.texto, preferencia.id] }
    end
    f.actions
  end
  
end
