#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer define-raylib (ffi-lib "/home/swilley/.guix-profile/lib/libraylib"))

(define-cstruct _Color
  ([r _ubyte] ; Color red value
   [g _ubyte] ; Color green value
   [b _ubyte] ; Color blue value
   [a _ubyte] ; Color alpha value
   ))

(define-raylib InitWindow (_fun _int _int _string -> _void ))
(define-raylib CloseWindow (_fun -> _void))
(define-raylib WindowShouldClose (_fun -> _void))
(define-raylib SetTargetFPS (_fun _int -> _void))
(define-raylib ClearBackground (_fun _Color -> _void))
(define-raylib BeginDrawing (_fun -> _void))
(define-raylib EndDrawing (_fun -> _void))
(define-raylib DrawText (_fun _string _int _int _int _Color -> _void))

(define GRAY (make-Color 130 130 130 255))
(define RAYWHITE (make-Color 245 245 245 255))

(module+ main
  (InitWindow 800 450 "raylib [core] example - basic window")

  (let loop ()
    (when (not (WindowShouldClose))
      (BeginDrawing)
      (ClearBackground RAYWHITE)
      (DrawText "Congrats! You created your first window!" 190 200 20 GRAY)
      (EndDrawing)
      (loop)))

  (CloseWindow))
