;////////////////
;Guia 2 - AutoLISP
;////////////////
;Ejercicio 2

(defun c:foo_linterna()
  (command "osmode" 0)
  (command "surftab1" 20)
  (command "surftab2" 20)
  (command "isolines" 20)
  ;
  (setq pBase (getpoint "hacé click donde va la linterna."))  
  (command "cylinder" pBase 20 20)
  (setq base(entlast))
  (setq p1 (list (+ 20 (nth 0 pBase)) (nth 1 pBase) (nth 2 pBase) ))
  (command "cylinder" p1 3 20)
  (setq aux1(entlast))
  (command "arraypolar" aux1 "" pBase "i" 15 "" "exit" "")
  (setq aux2(entlast))
  (command "explode" aux2)  
  (setq aux3(ssget "p"))
  (command "subtract" base "" aux3 "" "")
  ;
  (setq p2 (list (nth 0 pBase) (nth 1 pBase) (+ (nth 2 pBase) 20) ))
  (command "sphere" p2 20)
  (setq esfera1(entlast))
  (command "cylinder" pBase 20 20)
  (setq aux1(entlast))
  (command "subtract" esfera1 "" aux1 "" "")
  (command "cylinder" p2 10 60)
  (setq aux1(entlast))
  (command "union" esfera1 aux1 "")
  ;
  (setq p3 (list (nth 0 pBase) (nth 1 pBase)  (+ (nth 2 pBase) 80) ))
  (command "sphere" p3 10)
  (setq esfera2(entlast))
  (command "cylinder" p2 10 60)
  (setq aux1(entlast))
  (command "subtract" esfera2 "" aux1 "" "")
  (command "cylinder" p3 2 18)
  (setq aux2(entlast))
  ;
  (setq p4 (list (nth 0 pBase) (nth 1 pBase)  (+ (nth 2 pBase) 98) ))
  (command "sphere" p4 2)
  (setq esfera3(entlast))
  (command "union" esfera3 aux2 esfera2 "")
  ;
  (setq p5 (list (nth 0 p3) (- (nth 1 p3) 2 ) (- (nth 2 p3) 2 ) ))
  (setq p6 (list (+ 15 (nth 0 p5)) (+ (nth 1 p5)4)(- (nth 2 p5) 2 ) ))
  (command "box" p5 p6)
  (setq enganche1(entlast))
  ;
  (setq p7 (list (- (nth 0 p6) 2 ) (- (nth 1 p6) 4) (- (nth 2 p6 )20) ))
  (command "box" p6 p7)
  (setq enganche2(entlast))
  ;
  (command "union" enganche1 enganche2 "")
)


;Ejercicio 3
;apagar onsnap
(defun c:foo_lapicera()
  ;configuración de cad  
  (command "osmode" 0)
  (command "surftab1" 20)
  (command "surftab2" 20)
  (command "isolines" 20)
  (command "-layer" "n" "Agarradera" "c" "1" "Agarradera" "") ;creación de layer
  (command "-layer" "set" "0" "") ;seteo layer 0
  ;inicio del ejercicio
  (setq puntobase (getpoint "hacé click donde va la lapicera."))
  (setq p1 (list(nth 0 puntobase)(nth 1 puntobase)(+ 13 (nth 2 puntobase))))
  ;
  (setq conoBase(entnext))
  	(command "cone" p1 3.5 -13)
  ;
  (setq cuerpoLapicera(entnext))
  	(command "cylinder" p1 3.5 78)
  ;
  (setq p2 (list(nth 0 p1)(nth 1 p1)(+ 78 (nth 2 p1))))
  (command "cylinder" p2 2 7)
  (setq cilindroDelClick(entlast))  	
  ;
  (setq p3 (list(nth 0 p2)(nth 1 p2)(+ 7 (nth 2 p2))))
  (command "sphere" p3 2)
  (setq esferaDelClick(entlast))  	
  ;
  (command "subtract" esferaDelClick "" cilindroDelClick "")
  (command "cylinder" p2 2 7)
  (setq cilindroDelClick(entlast))
  ;
  (setq p4 (list (nth 0 p2) (- (nth 1 p2) 0.5) (nth 2 p2) ))
  (setq p5 (list (+ 5(nth 0 p2)) (+ (nth 1 p2) 0.5) (- (nth 2 p2) 0.5) ))
  (command "box" p4 p5)
  (setq enganche1(entlast))
  ;
  (setq p6 (list (- (nth 0 p5) 0.5) (- (nth 1 p5) 1) (- (nth 2 p5) 19) ))
  (command "box" p5 p6)
  (setq enganche2(entlast))
  ;
  (command "-layer" "set" "Agarradera" "") ;seteo layer agarradera
   (command "cylinder" p1 4 30)
  (setq cilindro1(entlast))
  (command "cylinder" p1 3.5 30)
  (setq cilindro2(entlast))
  (command "subtract" cilindro1 "" cilindro2 "")
  ;
  (setq p7 (list (+ 4 (nth 0 p1))(nth 1 p1)(nth 2 p1) ))
  (command "cylinder" p7 0.5 30)
  (setq aux(entlast))
  (command "arraypolar" aux "" p1 "i" 10 "" "exit" "")
  (setq aux2(entlast))
  (command "explode" aux2)  
  (setq aux3(ssget "p"))
  (command "subtract" cilindro1 "" aux3 "" "")
)


