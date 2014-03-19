;;;
;;; HLTB Port to Lisp
;;; From https://github.com/fenak/hltb
;;; Autor: Leon Waldman - le.waldman <at> gmail.com
;;;

;;; Loading libs
(ql:quickload '("drakma"
                "closure-html"
                "cxml-stp"))

;;; \o/!
(defun main()
  (if (= (length *posix-argv*) 2)
    (let* ((query (list (cons "queryString" (nth 1 *posix-argv*))))
           (str (drakma:http-request "http://www.howlongtobeat.com/search_main.php?t=games&page=1&sorthead=&sortd=Normal&plat=&detail=0"
                                     :method :post
                                     :parameters query))
           (document (chtml:parse str (cxml-stp:make-builder))))
      (xpath:with-namespaces ((nil "http://www.w3.org/1999/xhtml"))
        (let* ((gamename (xpath:string-value (xpath:evaluate "//h3/a" document)))
               (mainstory (xpath:string-value (xpath:evaluate "//*[@class=\"gamelist_tidbit time_90\"]" document)))
               (mainplusextra (xpath:string-value (xpath:evaluate "//*[@class=\"gamelist_tidbit time_70\"]" document)))
               (completionist (xpath:string-value (xpath:evaluate "//*[@class=\"gamelist_tidbit time_60\"]" document)))
               (combined (xpath:string-value (xpath:evaluate "//*[@class=\"gamelist_tidbit time_100\"]" document))))
          (format t "Game Name: ~A~%Main Story: ~A~%Main + Extra: ~A~%Completionist: ~A~%Combined: ~A~%"
                  gamename mainstory mainplusextra completionist combined))))
    0)
  1)

;;; Thou shall compile!
(save-lisp-and-die "cl-hltb" :toplevel #'main :executable t)

