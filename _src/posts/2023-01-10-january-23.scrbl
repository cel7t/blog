#lang scribble/manual

Title: The First Week of January 2023
Date: 2023-01-10T13:33:07
Tags: 

@(require
   scribble/example
   (only-in scribble/eval interaction-eval interaction/no-prompt)
   (for-label typed/racket/base))

@(define deep-eval (make-base-eval #:lang 'typed/racket))
@(define shallow-eval (make-base-eval #:lang 'typed/racket/shallow))
@(define optional-eval (make-base-eval #:lang 'typed/racket/optional))

@(define (tech/reference . text)
   (apply tech text #:doc '(lib "scribblings/reference/reference.scrbl")))

@(define-syntax-rule (module-example #:eval ev #:label lbl lang-datum mod-code ... ex-code)
   (list
     (if lbl (list lbl) '())
     (racketmod lang-datum mod-code ...)
     (interaction-eval #:eval ev mod-code ...)
     (interaction/no-prompt #:eval ev ex-code)))

I decided to start writing a blog to talk about my ventures in programming and system administration to document my progress and motivate me to do more. This entry covers what I did in the first week of January, 2023.


@section{Torus Wrapper}


One of the projects I poured a bunch of time into was @hyperlink["https://github.com/cel7t/TorusWrapper"]{Torus Wrapper}, which was an effort to wrap transparent PNGs into tiles that can be tiled to make tiling wallpapers, tiling game assets, et cetera. A high-level overview of how this is done is that the program takes in a transparent png, finds the @bold{biggest} rectangle @italic{inside} it and then wraps the parts not fitting in the rectangle atop it. Here's an example of a tile created with it:
@linebreak{}
@image["img/tile.png" #:scale 0.5]


@section{@italic{Lots} of Websites}


I worked on a @italic{lot} of websites during this break; @hyperlink["https://untyped.ml"]{my personal site}, @hyperlink["https://bits-sos.ml"]{BITS SOS' site} and the Journal Club's new website.
I used static site generators to build BITS SOS and JC's sites, as they provide a simple way to theme huge websites; however, these are not free of hiccups.
Themes often come configured wrong and can cause CSS and images to not load if the paths are not set right. Luckily, there were no other major problems setting up either of them with @hyperlink["https://gohugo.io"]{HUGO}.
For my personal site, I wrote the main site in @hyperlink["https://clojurescript.org"]{ClojureScript} (with @hyperlink["https://github.com/reagent-project/reagent"]{Reagent}) and the blog site in @hyperlink["https://docs.racket-lang.org/frog/index.html"]{Frog}. The blog (this site) is based on @hyperlink["https://blog.racket-lang.org"]{Racket lang's blog}.


@section{Tiny Improvements to my R6RS Infix Calculator}


I abstracted away a lot of the recursion in my @hyperlink{"https://github.com/cel7t/R6RS-Calculator"}[R6RS infix expression calculator] by defining a new macro to handle functions that iterate over a carry-forwarded list and adding the clojure thread-first macro (->). I planned on implementing something called the @italic{Nestedness Theorem}, which is that @italic{the rightmost open paren is always safe to evaluate}. However, my current approach is more-or-less similar to this, hence I did not rewrite it. I also added additional error checking; the program now checks if parens are balanced.


@section{Adding a DDNS to my Home Server}


I was previously connecting to my home server through a static IP, however I realized that my usage needs could be met with a dynamic IP using a dynamic DNS. I thus set up a DDNS on the server and bound its internal IP to ensure that I could boot into it after it rebooted. Home servers are excellent for maintaining private remote project repositories, hosting messenger bots or services like IRC bouncers and testing out dynamic websites.

@close-eval[deep-eval]
@close-eval[shallow-eval]
@close-eval[optional-eval]
