ActiveAdmin.register Respuesta do
  menu parent: "Encuestas"
  permit_params :cliente_id, :formulario_pregunta_id, :valor_respuesta
 
  
end
