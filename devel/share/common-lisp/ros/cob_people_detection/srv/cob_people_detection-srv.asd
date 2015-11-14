
(cl:in-package :asdf)

(defsystem "cob_people_detection-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "captureImage" :depends-on ("_package_captureImage"))
    (:file "_package_captureImage" :depends-on ("_package"))
    (:file "recognitionTrigger" :depends-on ("_package_recognitionTrigger"))
    (:file "_package_recognitionTrigger" :depends-on ("_package"))
    (:file "finishRecording" :depends-on ("_package_finishRecording"))
    (:file "_package_finishRecording" :depends-on ("_package"))
  ))