#lang racket/base

(require json)

(define raylib-path "../api/raylib.json")
(define raymath-path "../api/raymath.json")

(define raylib-input-port (open-input-file raylib-path))
(define raymath-input-port (open-input-file raymath-path))

(define raylib-data (read-json raylib-input-port))
(define raymath-data (read-json raymath-input-port))

(define raylib-defines (hash-ref raylib-data 'defines))
(define raylib-structs (hash-ref raylib-data 'structs))
(define raylib-aliases (hash-ref raylib-data 'aliases))
(define raylib-enums (hash-ref raylib-data 'enums))
(define raylib-callbacks (hash-ref raylib-data 'callbacks))
(define raylib-functions (hash-ref raylib-data 'functions))

(define raymath-defines (hash-ref raymath-data 'defines))
(define raymath-structs (hash-ref raymath-data 'structs))
(define raymath-aliases (hash-ref raymath-data 'aliases))
(define raymath-enums (hash-ref raymath-data 'enums))
(define raymath-callbacks (hash-ref raymath-data 'callbacks))
(define raymath-functions (hash-ref raymath-data 'functions))

;; Functions

;; (for-each (lambda (item)
;;             (let ([fun-name (hash-ref item 'name)]
;;                   [fun-return-type (hash-ref item 'returnType)]
;;                    [fun-parameters (if (hash-has-key? item 'params)
;;                                        ;; (hash-ref item 'params)
;;                                        (map (lambda (parameter)
;;                                                    (list (hash-ref parameter 'name) (hash-ref parameter 'type)))
;;                                                  (hash-ref item 'params))
;;                                    '())])
;;               (printf "Function: ~a with parameters ~a that returns ~a\n\n" fun-name fun-parameters fun-return-type)))
;;            raylib-functions)

;; Structs

;; (for-each (lambda (item)
;;             (let ([struct-name (hash-ref item 'name)]
;;                   [struct-fields (if (hash-has-key? item 'fields)
;;                                      (map (lambda (field)
;;                                             (list (hash-ref field 'name) (hash-ref field 'type)))
;;                                           (hash-ref item 'fields))
;;                                      '())])
;;                   (printf "Struct: ~a with fields ~a\n\n" struct-name struct-fields)))
;;           raylib-structs)

;; Definitions

;; (for-each (lambda (item)
;;             (let ([definition-name (hash-ref item 'name)]
;;                   [definition-type (hash-ref item 'type)]
;;                   [definition-value (hash-ref item 'value)])
;;               (printf "Definition ~a of type ~a with a value of ~a\n\n" definition-name definition-type definition-value)))
;;           raylib-defines)

;; Aliases

;; (for-each (lambda (item)
;;             (let ([alias-name (hash-ref item 'name)]
;;                   [alias-type (hash-ref item 'type)])
;;               (printf "Alias ~a is of type ~a\n\n" alias-name alias-type)))
;;           raylib-aliases)

;; Enums

;; (for-each (lambda (item)
;;             (let ([enum-name (hash-ref item 'name)]
;;                   [enum-values (if (hash-has-key? item 'values)
;;                                    (map (lambda (value)
;;                                           (list (hash-ref value 'name) (hash-ref value 'value)))
;;                                         (hash-ref item 'values))
;;                                    '())])
;;               (printf "Enum: ~a with values ~a\n\n" enum-name enum-values)))
;;  raylib-enums)

;; Callbacks

(for-each
 (lambda (item)
   (let ([callback-name (hash-ref item 'name)]
         [callback-return-type (hash-ref item 'returnType)]
         [callback-params (if (hash-has-key? item 'params)
                              (map (lambda (param)
                                     (list (hash-ref param 'name) (hash-ref param 'type)))
                                   (hash-ref item 'params))
                              '())])
     (printf "Callback: ~a that returns ~a with params ~a\n\n" callback-name callback-return-type callback-params)))
 raylib-callbacks)
