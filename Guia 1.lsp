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
  (command "rectangle" p1 p2)
  (setq p3 (list (+ 2.5 (nth 0 p1)) (+ 1 (nth 1 p1))))
  (setq p4 (list (- (nth 0 p2) 1) (- (nth 1 p2) 1)))
  (command "rectangle" p3 p4)
  )

;ejercicio 1.4
(defun c:foo_indicar ()
  (setq centro (getpoint "especifique centro"))
  (setq puntaFlecha (getpoint "especifique punta de la flecha"))
  (setq indicacion (getString "indique numero de indicacion"))
  (command "circle" centro 2)
  (command "line" centro puntaFlecha "")  
  (command "text" "j" "m" centro 1 0 indicacion "")    
  )

;ejercicio 1.5
(defun c:foo_areaYcoordenadasRectangulo ()
  ;ajustar maximo decimales a 3 
  (setq p1 (getpoint "especifique punto inf. izq"))
  (setq p2 (getpoint "especifique punto sup. der"))
  (command "rectangle" p1 p2)
  (setq centro (list (+(/ ( - (nth 0 p2)(nth 0 p1)) 2)(nth 0 p1)) (+(/ ( - (nth 1 p2)(nth 1 p1)) 2)(nth 1 p1))))  
  (setq area (* (- (nth 0 p2) (nth 0 p1))(- (nth 1 p2) (nth 1 p1))))
  (command "text" "j" "m" centro 1 0 area "")
  (setq p3 (list (nth 0 p1)(nth 1 p2)))
  (setq p4 (list (nth 0 p2)(nth 1 p1)))
  (command "text" "j" "l" p1 1 0 p1 "")
  (command "text"  p2 1 0 p2 "")
  (command "text"  p3 1 0 p3 "")
  (command "text"  p4 1 0 p4 "")
  )

;ejercicio 1.6
(defun c:foo_anillo ()
  (setq p1 (getpoint "centro del anillo"))
  (setq value (getint "introduzca valor: relleno=1 , vacio = 0"))
  (command "circle" p1 20)
  (setq anillo1(entlast))
  (command "circle" p1 10)
  (setq anillo2(entlast))
  (setq p2 (list (+ (nth 0 p1) 15)(nth 1 p1)))
  (IF (= value 1)    
    (command "hatch" p2 "n" "s" anillo1 anillo2 "") ;cond true
    ;cond false (nada)
   ) 
  )
		    