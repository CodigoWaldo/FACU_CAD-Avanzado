;////////////////
;Guia 1 - AutoLISP
;////////////////

;ejercicio 1.1
(defun c:foo_zoom ()
  (command "zoom" "a")
  (command "zoom" "e")
  (command "zoom" "w")
  (command "zoom" "p")
)

;ejercicio 1.2
(defun c:foo_rectangulo ()
  (setq puntoinfizq (getpoint "especifique punto inf. izq"))
  (setq puntosupder (getpoint "especifique punto sup. der"))
  (command "rectangle" puntoinfizq puntosupder)
  )

;ejercicio 1.3 ERROR
(defun c:foo_lamina()
  (setq puntoinfizq (getpoint "especifique punto inf. izq"))
  (setq puntosupder (getpoint "especifique punto sup. der"))
  (setq puntosupizq (list(nth 0 puntoinfizq)(nth 1 puntosupder)))
  (setq puntoinfder (list(nth 0 puntosupder)(nth 1 puntoinfizq)))
  (setq ladoIzq(entnext))
	 (command "line" puntoinfizq puntosupizq)
  (setq ladoSup(entnext))
	 (command "line" puntosupizq puntosupder)
  (setq ladoDer(entnext))
	 (command "line" puntosupder puntoinfder)
  (setq ladoInf(entnext))
	 (command "line" puntoinder puntoinfizq)
 )

;ejercicio 1.4
(defun c:foo_rectangulo2 ()
  (setq puntoinfizq (getpoint "especifique punto inf. izq"))
  (setq puntosupder (getpoint "especifique punto sup. der"))
  (command "rectangle" puntoinfizq puntosupder)
  (setq centro (list((/ (nth 0 puntosupder) 2)(/ (nth 1 puntosupder)2)
  (command "text" "0,0" 1 0 "hola" "")
  )
