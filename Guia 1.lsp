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

;ejercicio 1.3 
(defun c:foo_lamina()
  (setq p1 (getpoint "especifique punto inf. izq"))
  (setq p2 (getpoint "especifique punto sup. der"))
  (setq p3 (list (+ 2.5 (nth 0 p1)) (+ 1 (nth 1 p1))))
  (setq p4 (list (- (nth 0 p2) 1) (- (nth 1 p2) 1))) )

;ejercicio 1.4
(defun c:foo_rectangulo2 ()
  (setq puntoinfizq (getpoint "especifique punto inf. izq"))
  (setq puntosupder (getpoint "especifique punto sup. der"))
  (command "rectangle" puntoinfizq puntosupder)
  (setq centro (list((/ (nth 0 puntosupder) 2)(/ (nth 1 puntosupder)2)
  (command "text" "0,0" 1 0 "hola" "")
  )
