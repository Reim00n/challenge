ActiveAdmin.register Encuesta do

  menu parent: "Encuestas"
  permit_params :nombre, :estado, :preferencia_id


form do |f|
  f.inputs  do
    f.input :nombre
    f.input :estado, as: :select, collection: Encuesta.estados.keys
    f.input :preferencia_id, as: :select, collection: Preferencia.all.collect { |preferencia| [preferencia.texto,preferencia.id]}
  end
  f.actions
end
 
end
