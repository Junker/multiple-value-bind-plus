(defpackage multiple-value-bind-plus
  (:use #:cl #:uiop)
  (:export #:multiple-value-bind+))
(in-package :multiple-value-bind-plus)

(defmacro multiple-value-bind+ (vars values &body body)
  "This macro is like MULTIPLE-VALUE-BIND but with
 support for `_` placeholder symbols"
  (let* ((prefix "%%MVB+")
         (processed-vars
           (mapcar (lambda (var)
                     (if (string= (symbol-name var) "_")
                         (gensym prefix)
                         var))
                   vars))
         (ignored-vars (remove-if-not (lambda (var)
                                        (string-prefix-p prefix
                                                         (symbol-name var)))
                                      processed-vars)))
    `(multiple-value-bind ,processed-vars ,values
       ,@(if ignored-vars `((declare (ignore ,@ignored-vars))))
       ,@body)))
