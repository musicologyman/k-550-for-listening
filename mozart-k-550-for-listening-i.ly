\version "2.18.2"

\header {
  tagline = ##f
}

#(set! paper-alist (cons '("my size" . (cons (* 8.5 in) (* 1.7 in))) paper-alist))

\paper {
  #(set-paper-size "my size" )
  print-page-number = ##f
  max-systems-per-page = #1
}

\layout {
  indent = 0 \in
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

\paper {
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}

main = \relative c' {
 \clef treble
 \key g \minor
 \time 2/2
 \stemDown
   g8 \p ^\markup \bold "Molto Allegro" _\markup \italic "violas" g es' es
   g, [g] \stemNeutral es'' ^\markup \column {
     \line \huge \bold { P\super{1}}
     \line \italic { violins } } (d) |
   d4 es8 (d) d4 es8 (d) |
   d4 (bes') r bes8 (a) |
   g4 g8 (f) es4 es8 (d) |
   c4 c r d8 (c) |

   %measure 6
   c4 d8 (c) c4 d8 (c) |
   c4 (a') r a8 (g) |
   fis4 fis8 (es) d4 d8 (c) |
   bes4 bes r bes'8 (a) |
   a4 (c fis, a) |
   g (d) r bes'8 (a) |
   a4 (c fis, a) |
   g (bes a8 g f es) |

   %measure 14
   << { s4 fis ^\p ^\markup \italic "woodwinds" (g a bes c8 bes a4 g fis4 s ) } \\
      { d1 (cis1 d2) } >>

     r4 d,8 \f d |

   %measure 17
   d2 r4 d8 d |
   d2 r4 d8 d |
   d4 d8 d d4 d8 d |
   d2 r4 es'8 \p (d) |
   d4 es8 (d) d4 es8 (d) |

   %measure 22
   d4 (bes') r bes8 (a) |
   g4 g8 (f) es4 es8 (d) |
   c4 c r f8 (es) |
   es4 f8 (es) es4 f8 (es) |
   es4 (c') r c8 (bes) |

   %measure 27
   a4 a8 (g) f4 f8 (es) |
   bes'1 \f ^\markup \column { \line \huge { \bold { P \super 2 } } \line { \italic "[full orchestra plays here]" } }|
   f2. r8 f |
   es4-! g-! bes-! r |
   d,-! f-! bes-! r8 d, |

   %measure 32
   c4-! es-! g-! c,-! |
   bes-! d-! f-! r8 f |
   \repeat unfold 3 { e8 f g a bes c des f, }

   %measure 37
   e f g a bes c des e, |
   f2 c'4-! a-! |
   des2 e,4-! g-! |
   f2 c'8 a c a |
   des bes des bes e, g e g |
   f4 r f, r |

}

\score {
  <<
    \new Staff = "main" \with {
      midiInstrument = "string ensemble 2"
    } \main
  >>

  \layout { }
  \midi {
    \tempo 2=92
  }
}
