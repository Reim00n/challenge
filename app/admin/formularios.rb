ActiveAdmin.register Formulario do

  menu parent: "Encuestas"
  permit_params :encuesta_id,
  pregunta_ids: []
 
  
  form do |f|
    f.inputs  do
      f.input :encuesta_id, as: :select, collection: Encuesta.all.collect { |encuesta| [encuesta.nombre,encuesta.id]}
      f.input :pregunta_ids, label:"Pregunta", as: :select, multiple: true, collection: Pregunta.all.collect { |pregunta| [pregunta.texto, pregunta.id] }
  
    end
    f.actions
  end
end