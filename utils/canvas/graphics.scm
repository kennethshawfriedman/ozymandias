(define (canvas-open generator . args)
  (generator (apply make-canvas args)))

(define descriptor)

(define (canvas-wrapper f)
  (lambda (canvas . args)
    (let ((descriptor (record-accessor (record-type-descriptor canvas) 'descriptor)))
      (apply f (descriptor canvas) args))))

(define graphics-type/canvas (make-graphics-device-type 'canvas
  `((clear ,(canvas-wrapper canvas-clear))
    (close ,(canvas-wrapper canvas-close))
    (available? ,canvas-available?)
    (coordinate-limits ,(canvas-wrapper canvas-coordinate-limits))
    (device-coordinate-limits ,(canvas-wrapper canvas-device-coordinate-limits))
    (drag-cursor ,(canvas-wrapper canvas-drag-cursor))
    (draw-line ,(canvas-wrapper canvas-draw-line))
    (draw-point ,(canvas-wrapper canvas-draw-point))
    (draw-text ,(canvas-wrapper canvas-draw-text))
    (flush ,canvas-flush)
    (move-cursor ,(canvas-wrapper canvas-move-cursor))
    (open ,canvas-open)
    (reset-clip-rectangle ,(canvas-wrapper canvas-reset-clip-rectangle))
    (set-clip-rectangle ,(canvas-wrapper canvas-set-clip-rectangle))
    (set-coordinate-limits ,(canvas-wrapper canvas-set-coordinate-limits))
    (set-drawing-mode ,(canvas-wrapper canvas-set-drawing-mode))
    (set-line-style ,(canvas-wrapper canvas-set-line-style))
    (draw-points ,(canvas-wrapper canvas-draw-points))
    (set-font ,(canvas-wrapper canvas-set-font))
    (set-name ,(canvas-wrapper canvas-rename))
    (set-device-coordinate-limits ,(canvas-wrapper canvas-resize)))))