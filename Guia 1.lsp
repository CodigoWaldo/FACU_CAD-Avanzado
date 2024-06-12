;Guia 1 - AutoLISP
;ejercicio 1.1
(defun c:foo_zoom ()
  (command "zoom" "a")
  (command "zoom" "e")
  (command "zoom" "w")
  (command "zoom" "p")
)

;ejercicio 1.2
Construya un programa AutoLISP que dibuje un rectángulo ingresando el punto inferior 
izquierdo y el punto superior derecho por coordenadas o con el mouse

(defun c:foo_rectangulo ()
  (setq puntoinfizq (getpoint "especifique punto inf. izq"))
  (setq puntosupder (getpoint "especifique punto sup. der"))
  (command "rectangle" puntoinfizq puntosupder)
  )