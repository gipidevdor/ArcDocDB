;;;; package.lisp — package radice di ArcDocDB.

(defpackage #:arcdocdb
  (:use #:cl)
  (:export #:*version*)
  (:documentation
   "ArcDocDB root package. Exports the system version. Documentation is in docs/; architecture decisions are in docs/adr/."))

(in-package #:arcdocdb)

(defparameter *version* "0.0.0"
  "System version. 0.0.0 identifies the unreleased development version.")
